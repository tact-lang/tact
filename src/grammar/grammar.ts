import {
    Interval as RawInterval,
    Node,
    IterationNode,
    NonterminalNode,
    grammar,
    Grammar,
} from "ohm-js";
import tactGrammar from "./grammar.ohm-bundle";
import { throwInternalCompilerError } from "../errors";
import {
    AstAugmentedAssignOperation,
    AstConstantAttribute,
    AstContractAttribute,
    AstExpression,
    AstFunctionAttribute,
    AstNode,
    AstModule,
    AstReceiverKind,
    AstString,
    AstType,
    createAstNode,
    AstImport,
    AstConstantDef,
    AstNumberBase,
} from "./ast";
import { throwParseError, throwSyntaxError } from "../errors";
import { checkVariableName } from "./checkVariableName";
import { checkFunctionAttributes } from "./checkFunctionAttributes";
import { checkConstAttributes } from "./checkConstAttributes";

export type ItemOrigin = "stdlib" | "user";

let ctx: { origin: ItemOrigin } | null;

/**
 * Information about source code location (file and interval within it)
 * and the source code contents.
 */
export class SrcInfo {
    readonly #interval: RawInterval;
    readonly #file: string | null;
    readonly #origin: ItemOrigin;

    constructor(
        interval: RawInterval,
        file: string | null,
        origin: ItemOrigin,
    ) {
        this.#interval = interval;
        this.#file = file;
        this.#origin = origin;
    }

    get file() {
        return this.#file;
    }

    get contents() {
        return this.#interval.contents;
    }

    get interval() {
        return this.#interval;
    }

    get origin() {
        return this.#origin;
    }
}

const DummyGrammar: Grammar = grammar("Dummy { DummyRule = any }");
const DUMMY_INTERVAL = DummyGrammar.match("").getInterval();
export const dummySrcInfo: SrcInfo = new SrcInfo(DUMMY_INTERVAL, null, "user");

let currentFile: string | null = null;

function inFile<T>(path: string, callback: () => T) {
    currentFile = path;
    const r = callback();
    currentFile = null;
    return r;
}

function createRef(s: Node): SrcInfo {
    return new SrcInfo(s.source, currentFile, ctx!.origin);
}

// helper to unwrap optional grammar elements (marked with "?")
// ohm-js represents those essentially as lists (IterationNodes)
function unwrapOptNode<T>(
    optional: IterationNode,
    f: (n: Node) => T,
): T | null {
    const optNode = optional.children[0] as Node | undefined;
    return optNode !== undefined ? f(optNode) : null;
}

const semantics = tactGrammar.createSemantics();

semantics.addOperation<AstNode>("astOfModule", {
    Module(imports, items) {
        return createAstNode({
            kind: "module",
            imports: imports.children.map((item) => item.astOfImport()),
            items: items.children.map((item) => item.astOfModuleItem()),
        });
    },
});

semantics.addOperation<AstNode>("astOfImport", {
    Import(_importKwd, path, _semicolon) {
        const pathAST = path.astOfExpression() as AstString;
        if (pathAST.value.includes("\\")) {
            throwSyntaxError(
                'Import path can\'t contain "\\"',
                createRef(path),
            );
        }
        return createAstNode({
            kind: "import",
            path: pathAST,
            loc: createRef(this),
        });
    },
});

semantics.addOperation<AstImport[]>("astOfJustImports", {
    JustImports(imports, _restOfInput) {
        return imports.children.map((item) => item.astOfImport());
    },
});

semantics.addOperation<AstNode>("astOfModuleItem", {
    PrimitiveTypeDecl(_primitive_kwd, typeId, _semicolon) {
        checkVariableName(typeId.sourceString, createRef(typeId));
        return createAstNode({
            kind: "primitive_type_decl",
            name: typeId.astOfType(),
            loc: createRef(this),
        });
    },
    NativeFunctionDecl(
        _name,
        _lparen1,
        funcId,
        _rparen1,
        funAttributes,
        _nativeKwd,
        tactId,
        params,
        _optColon,
        optReturnType,
        _semicolon,
    ) {
        checkVariableName(tactId.sourceString, createRef(tactId));
        return createAstNode({
            kind: "native_function_decl",
            attributes: funAttributes.children.map((a) =>
                a.astOfFunctionAttributes(),
            ),
            name: tactId.astOfExpression(),
            nativeName: funcId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            params: params.astsOfList(),
            loc: createRef(this),
        });
    },
    StructDecl_regular(_structKwd, typeId, _lbrace, fields, _rbrace) {
        checkVariableName(typeId.sourceString, createRef(typeId));
        return createAstNode({
            kind: "struct_decl",
            name: typeId.astOfType(),
            fields: fields.astsOfList(),
            loc: createRef(this),
        });
    },
    StructDecl_message(
        _messageKwd,
        _optLparen,
        optIntMsgId,
        _optRparen,
        typeId,
        _lbrace,
        fields,
        _rbrace,
    ) {
        checkVariableName(typeId.sourceString, createRef(typeId));
        return createAstNode({
            kind: "message_decl",
            name: typeId.astOfType(),
            fields: fields.astsOfList(),
            opcode: unwrapOptNode(optIntMsgId, (number) =>
                number.astOfExpression(),
            ),
            loc: createRef(this),
        });
    },
    Contract(
        attributes,
        _contractKwd,
        contractId,
        _optWithKwd,
        optInheritedTraits,
        _lbrace,
        contractItems,
        _rbrace,
    ) {
        checkVariableName(contractId.sourceString, createRef(contractId));
        return createAstNode({
            kind: "contract",
            name: contractId.astOfExpression(),
            attributes: attributes.children.map((ca) =>
                ca.astOfContractAttributes(),
            ),
            declarations: contractItems.children.map((item) =>
                item.astOfItem(),
            ),
            traits: optInheritedTraits.children[0]?.astsOfList() ?? [],
            loc: createRef(this),
        });
    },
    Trait(
        attributes,
        _traitKwd,
        traitId,
        _optWithKwd,
        optInheritedTraits,
        _lbrace,
        traitItems,
        _rbrace,
    ) {
        checkVariableName(traitId.sourceString, createRef(traitId));
        return createAstNode({
            kind: "trait",
            name: traitId.astOfExpression(),
            attributes: attributes.children.map((ca) =>
                ca.astOfContractAttributes(),
            ),
            declarations: traitItems.children.map((item) => item.astOfItem()),
            traits: optInheritedTraits.children[0]?.astsOfList() ?? [],
            loc: createRef(this),
        });
    },
    ModuleFunction(fun) {
        return fun.astOfItem();
    },
    ModuleConstant(constant) {
        const astConstDef: AstConstantDef = constant.astOfItem();
        if (astConstDef.attributes.length !== 0) {
            throwSyntaxError(
                `Module-level constants do not support attributes`,
                astConstDef.attributes[0]!.loc,
            );
        }
        return astConstDef;
    },
});

// top-level (module-level), contract or trait items:
// constant declarations/definitions, functions, receivers,
// getters, etc.
semantics.addOperation<AstNode>("astOfItem", {
    ConstantDefinition(
        constAttributes,
        _constKwd,
        constId,
        _colon,
        constType,
        _equals,
        initExpr,
        _semicolon,
    ) {
        const attributes = constAttributes.children.map((a) =>
            a.astOfConstAttribute(),
        ) as AstConstantAttribute[];
        checkConstAttributes(false, attributes, createRef(this));
        return createAstNode({
            kind: "constant_def",
            name: constId.astOfExpression(),
            type: constType.astOfType(),
            initializer: initExpr.astOfExpression(),
            attributes,
            loc: createRef(this),
        });
    },
    ConstantDeclaration(
        constAttributes,
        _constKwd,
        constId,
        _colon,
        constType,
        _semicolon,
    ) {
        const attributes = constAttributes.children.map((a) =>
            a.astOfConstAttribute(),
        ) as AstConstantAttribute[];
        checkConstAttributes(true, attributes, createRef(this));
        return createAstNode({
            kind: "constant_decl",
            name: constId.astOfExpression(),
            type: constType.astOfType(),
            attributes,
            loc: createRef(this),
        });
    },
    StorageVar(fieldDecl, _semicolon) {
        return fieldDecl.astOfDeclaration();
    },
    FunctionDefinition(
        funAttributes,
        _funKwd,
        funId,
        funParameters,
        _optColon,
        optReturnType,
        _lbrace,
        funBody,
        _rbrace,
    ) {
        const attributes = funAttributes.children.map((a) =>
            a.astOfFunctionAttributes(),
        ) as AstFunctionAttribute[];
        checkVariableName(funId.sourceString, createRef(funId));
        checkFunctionAttributes(false, attributes, createRef(this));
        return createAstNode({
            kind: "function_def",
            attributes,
            name: funId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            params: funParameters.astsOfList(),
            statements: funBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    AsmFunction(
        _asmKwd,
        optAsmShuffle,
        funAttributes,
        _funKwd,
        funId,
        funParameters,
        _optColon,
        optReturnType,
        _lbrace,
        asmInstructions,
        _rbrace,
    ) {
        const shuffle = optAsmShuffle.children[0]?.astsOfAsmShuffle() ?? {
            args: [],
            ret: [],
        };
        const attributes = funAttributes.children.map((a) =>
            a.astOfFunctionAttributes(),
        ) as AstFunctionAttribute[];
        checkVariableName(funId.sourceString, createRef(funId));
        checkFunctionAttributes(false, attributes, createRef(this));
        return createAstNode({
            kind: "asm_function_def",
            shuffle,
            attributes,
            name: funId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            params: funParameters.astsOfList(),
            instructions: asmInstructions.children.map((s) => s.sourceString),
            loc: createRef(this),
        });
    },
    FunctionDeclaration(
        funAttributes,
        _funKwd,
        funId,
        funParameters,
        _optColon,
        optReturnType,
        _semicolon,
    ) {
        const attributes = funAttributes.children.map((a) =>
            a.astOfFunctionAttributes(),
        ) as AstFunctionAttribute[];
        checkVariableName(funId.sourceString, createRef(funId));
        checkFunctionAttributes(true, attributes, createRef(this));
        return createAstNode({
            kind: "function_decl",
            attributes,
            name: funId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            params: funParameters.astsOfList(),
            loc: createRef(this),
        });
    },
    ContractInit(_initKwd, initParameters, _lbrace, initBody, _rbrace) {
        return createAstNode({
            kind: "contract_init",
            params: initParameters.astsOfList(),
            statements: initBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_regular(
        _receiveKwd,
        _lparen,
        optParameter,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        const optParam = optParameter.children[0] as Node | undefined;
        const selector: AstReceiverKind = optParam
            ? {
                  kind: "internal-simple",
                  param: optParam.astOfDeclaration(),
              }
            : { kind: "internal-fallback" };
        return createAstNode({
            kind: "receiver",
            selector,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_comment(
        _receiveKwd,
        _lparen,
        comment,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        return createAstNode({
            kind: "receiver",
            selector: {
                kind: "internal-comment",
                comment: comment.astOfExpression(),
            },
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_bounced(
        _bouncedKwd,
        _lparen,
        parameter,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        return createAstNode({
            kind: "receiver",
            selector: { kind: "bounce", param: parameter.astOfDeclaration() },
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_externalRegular(
        _externalKwd,
        _lparen,
        optParameter,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        const optParam = optParameter.children[0] as Node | undefined;
        const selector: AstReceiverKind = optParam
            ? {
                  kind: "external-simple",
                  param: optParam.astOfDeclaration(),
              }
            : { kind: "external-fallback" };
        return createAstNode({
            kind: "receiver",
            selector,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_externalComment(
        _externalKwd,
        _lparen,
        comment,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        return createAstNode({
            kind: "receiver",
            selector: {
                kind: "external-comment",
                comment: comment.astOfExpression(),
            },
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
});

semantics.addOperation<AstFunctionAttribute>("astOfFunctionAttributes", {
    FunctionAttribute_getter(_) {
        return { type: "get", loc: createRef(this) };
    },
    FunctionAttribute_extends(_) {
        return { type: "extends", loc: createRef(this) };
    },
    FunctionAttribute_mutates(_) {
        return { type: "mutates", loc: createRef(this) };
    },
    FunctionAttribute_override(_) {
        return { type: "override", loc: createRef(this) };
    },
    FunctionAttribute_inline(_) {
        return { type: "inline", loc: createRef(this) };
    },
    FunctionAttribute_virtual(_) {
        return { type: "virtual", loc: createRef(this) };
    },
    FunctionAttribute_abstract(_) {
        return { type: "abstract", loc: createRef(this) };
    },
});

semantics.addOperation<{ args: AstNode[]; ret: AstNode[] }>(
    "astsOfAsmShuffle",
    {
        AsmShuffle(_lparen, argsShuffle, _optArrow, optRetShuffle, _rparen) {
            return {
                args: argsShuffle.children.map((id) => id.astOfExpression()),
                ret:
                    optRetShuffle.children[0]?.children.map((num) =>
                        num.astOfExpression(),
                    ) ?? [],
            };
        },
    },
);

semantics.addOperation<AstConstantAttribute>("astOfConstAttribute", {
    ConstantAttribute_override(_) {
        return { type: "override", loc: createRef(this) };
    },
    ConstantAttribute_virtual(_) {
        return { type: "virtual", loc: createRef(this) };
    },
    ConstantAttribute_abstract(_) {
        return { type: "abstract", loc: createRef(this) };
    },
});

semantics.addOperation<AstNode[]>("astsOfList", {
    InheritedTraits(traits, _optTrailingComma) {
        return traits
            .asIteration()
            .children.map((id, _comma) => id.astOfExpression());
    },
    StructFields(fields, _optSemicolon) {
        return fields
            .asIteration()
            .children.map((field, _semicolon) => field.astOfDeclaration());
    },
    Parameters(_lparen, params, optTrailingComma, _rparen) {
        if (
            params.source.contents === "" &&
            optTrailingComma.sourceString === ","
        ) {
            throwSyntaxError(
                "Empty parameter list should not have a dangling comma.",
                createRef(optTrailingComma),
            );
        }
        return params.asIteration().children.map((p) => p.astOfDeclaration());
    },
    Arguments(_lparen, args, optTrailingComma, _rparen) {
        if (
            args.source.contents === "" &&
            optTrailingComma.sourceString === ","
        ) {
            throwSyntaxError(
                "Empty argument list should not have a dangling comma.",
                createRef(optTrailingComma),
            );
        }
        return args.asIteration().children.map((arg) => arg.astOfExpression());
    },
});

semantics.addOperation<AstContractAttribute>("astOfContractAttributes", {
    ContractAttribute_interface(_interface, _lparen, interfaceName, _rparen) {
        return {
            type: "interface",
            name: interfaceName.astOfExpression(),
            loc: createRef(this),
        };
    },
});

semantics.addOperation<AstNode>("astOfDeclaration", {
    FieldDecl(
        id,
        _colon,
        type,
        _optAs,
        optStorageType,
        _optEq,
        optInitializer,
    ) {
        return createAstNode({
            kind: "field_decl",
            name: id.astOfExpression(),
            type: type.astOfType() as AstType,
            as: unwrapOptNode(optStorageType, (t) => t.astOfExpression()),
            initializer: unwrapOptNode(optInitializer, (e) =>
                e.astOfExpression(),
            ),
            loc: createRef(this),
        });
    },
    Parameter(id, _colon, type) {
        checkVariableName(id.sourceString, createRef(id));
        return createAstNode({
            kind: "typed_parameter",
            name: id.astOfExpression(),
            type: type.astOfType(),
            loc: createRef(this),
        });
    },
    StructFieldInitializer_full(fieldId, _colon, initializer) {
        return createAstNode({
            kind: "struct_field_initializer",
            field: fieldId.astOfExpression(),
            initializer: initializer.astOfExpression(),
            loc: createRef(this),
        });
    },
    StructFieldInitializer_punned(fieldId) {
        return createAstNode({
            kind: "struct_field_initializer",
            field: fieldId.astOfExpression(),
            initializer: fieldId.astOfExpression(),
            loc: createRef(this),
        });
    },
});

// Statements
semantics.addOperation<AstNode>("astOfStatement", {
    // TODO: process StatementBlock

    StatementLet(
        _letKwd,
        id,
        _optColon,
        optType,
        _equals,
        expression,
        _optSemicolonIfLastStmtInBlock,
    ) {
        checkVariableName(id.sourceString, createRef(id));

        return createAstNode({
            kind: "statement_let",
            name: id.astOfExpression(),
            type: unwrapOptNode(optType, (t) => t.astOfType()),
            expression: expression.astOfExpression(),
            loc: createRef(this),
        });
    },
    StatementReturn(_returnKwd, optExpression, _optSemicolonIfLastStmtInBlock) {
        return createAstNode({
            kind: "statement_return",
            expression: unwrapOptNode(optExpression, (e) =>
                e.astOfExpression(),
            ),
            loc: createRef(this),
        });
    },
    StatementExpression(expression, _optSemicolonIfLastStmtInBlock) {
        return createAstNode({
            kind: "statement_expression",
            expression: expression.astOfExpression(),
            loc: createRef(this),
        });
    },
    StatementAssign(
        lvalue,
        operator,
        expression,
        _optSemicolonIfLastStmtInBlock,
    ) {
        if (operator.sourceString === "=") {
            return createAstNode({
                kind: "statement_assign",
                path: lvalue.astOfExpression(),
                expression: expression.astOfExpression(),
                loc: createRef(this),
            });
        } else {
            let op: AstAugmentedAssignOperation;
            switch (operator.sourceString) {
                case "+=":
                    op = "+";
                    break;
                case "-=":
                    op = "-";
                    break;
                case "*=":
                    op = "*";
                    break;
                case "/=":
                    op = "/";
                    break;
                case "%=":
                    op = "%";
                    break;
                case "|=":
                    op = "|";
                    break;
                case "&=":
                    op = "&";
                    break;
                case "^=":
                    op = "^";
                    break;
                default:
                    throwInternalCompilerError(
                        "Unreachable augmented assignment operator.",
                    );
            }
            return createAstNode({
                kind: "statement_augmentedassign",
                path: lvalue.astOfExpression(),
                op,
                expression: expression.astOfExpression(),
                loc: createRef(this),
            });
        }
    },
    StatementCondition_noElse(_ifKwd, condition, _lbrace, thenBlock, _rbrace) {
        return createAstNode({
            kind: "statement_condition",
            condition: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: null,
            elseif: null,
            loc: createRef(this),
        });
    },
    StatementCondition_withElse(
        _ifKwd,
        condition,
        _lbraceThen,
        thenBlock,
        _rbraceThen,
        _elseKwd,
        _lbraceElse,
        elseBlock,
        _rbraceElse,
    ) {
        return createAstNode({
            kind: "statement_condition",
            condition: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: elseBlock.children.map((s) => s.astOfStatement()),
            elseif: null,
            loc: createRef(this),
        });
    },
    StatementCondition_withElseIf(
        _ifKwd,
        condition,
        _lbraceThen,
        thenBlock,
        _rbraceThen,
        _elseKwd,
        elseifClause,
    ) {
        return createAstNode({
            kind: "statement_condition",
            condition: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: null,
            elseif: elseifClause.astOfStatement(),
            loc: createRef(this),
        });
    },
    StatementWhile(
        _whileKwd,
        _lparen,
        condition,
        _rparen,
        _lbrace,
        loopBody,
        _rbrace,
    ) {
        return createAstNode({
            kind: "statement_while",
            condition: condition.astOfExpression(),
            statements: loopBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    StatementRepeat(
        _repeatKwd,
        _lparen,
        iterations,
        _rparen,
        _lbrace,
        loopBody,
        _rbrace,
    ) {
        return createAstNode({
            kind: "statement_repeat",
            iterations: iterations.astOfExpression(),
            statements: loopBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    StatementUntil(
        _doKwd,
        _lbrace,
        loopBody,
        _rbrace,
        _untilKwd,
        _lparen,
        condition,
        _rparen,
        _optSemicolonIfLastStmtInBlock,
    ) {
        return createAstNode({
            kind: "statement_until",
            condition: condition.astOfExpression(),
            statements: loopBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    StatementTry_noCatch(_tryKwd, _lbraceTry, tryBlock, _rbraceTry) {
        return createAstNode({
            kind: "statement_try",
            statements: tryBlock.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    StatementTry_withCatch(
        _tryKwd,
        _lbraceTry,
        tryBlock,
        _rbraceTry,
        _catchKwd,
        _lparen,
        exitCodeId,
        _rparen,
        _lbraceCatch,
        catchBlock,
        _rbraceCatch,
    ) {
        return createAstNode({
            kind: "statement_try_catch",
            statements: tryBlock.children.map((s) => s.astOfStatement()),
            catchName: exitCodeId.astOfExpression(),
            catchStatements: catchBlock.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    StatementForEach(
        _foreachKwd,
        _lparen,
        keyId,
        _comma,
        valueId,
        _inKwd,
        mapId,
        _rparen,
        _lbrace,
        foreachBlock,
        _rbrace,
    ) {
        checkVariableName(keyId.sourceString, createRef(keyId));
        checkVariableName(valueId.sourceString, createRef(valueId));
        return createAstNode({
            kind: "statement_foreach",
            keyName: keyId.astOfExpression(),
            valueName: valueId.astOfExpression(),
            map: mapId.astOfExpression(),
            statements: foreachBlock.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
});

semantics.addOperation<AstNode>("astOfType", {
    typeId(firstTactTypeIdCharacter, restOfTactTypeId) {
        return createAstNode({
            kind: "type_id",
            text:
                firstTactTypeIdCharacter.sourceString +
                restOfTactTypeId.sourceString,
            loc: createRef(this),
        });
    },
    Type_optional(typeId, _questionMark) {
        return createAstNode({
            kind: "optional_type",
            typeArg: typeId.astOfType(),
            loc: createRef(this),
        });
    },
    Type_regular(typeId) {
        return typeId.astOfType();
    },
    Type_map(
        _mapKwd,
        _langle,
        keyTypeId,
        _optAsKwdKey,
        optKeyStorageType,
        _comma,
        valueTypeId,
        _optAsKwdValue,
        optValueStorageType,
        _rangle,
    ) {
        return createAstNode({
            kind: "map_type",
            keyType: keyTypeId.astOfType(),
            keyStorageType: unwrapOptNode(optKeyStorageType, (t) =>
                t.astOfExpression(),
            ),
            valueType: valueTypeId.astOfType(),
            valueStorageType: unwrapOptNode(optValueStorageType, (t) =>
                t.astOfExpression(),
            ),
            loc: createRef(this),
        });
    },
    Type_bounced(_bouncedKwd, _langle, typeId, _rangle) {
        return createAstNode({
            kind: "bounced_message_type",
            messageType: typeId.astOfType(),
            loc: createRef(this),
        });
    },
});

// handles binary, octal, decimal and hexadecimal integer literals
function bigintOfIntLiteral(litString: NonterminalNode): bigint {
    return BigInt(litString.sourceString.replaceAll("_", ""));
}

function baseOfIntLiteral(node: NonterminalNode): AstNumberBase {
    const basePrefix = node.sourceString.slice(0, 2).toLowerCase();
    switch (basePrefix) {
        case "0x":
            return 16;
        case "0o":
            return 8;
        case "0b":
            return 2;
        default:
            return 10;
    }
}

function astOfNumber(node: Node): AstNode {
    return createAstNode({
        kind: "number",
        base: baseOfIntLiteral(node),
        value: bigintOfIntLiteral(node),
        loc: createRef(node),
    });
}

// Expressions
semantics.addOperation<AstNode>("astOfExpression", {
    // Literals
    integerLiteral(_) {
        // Parses dec, hex, and bin numbers
        return astOfNumber(this);
    },
    integerLiteralDec(_) {
        return astOfNumber(this);
    },
    integerLiteralHex(_0x, _digit, _1, _2) {
        return astOfNumber(this);
    },
    boolLiteral(boolValue) {
        return createAstNode({
            kind: "boolean",
            value: boolValue.sourceString === "true",
            loc: createRef(this),
        });
    },
    id(firstTactIdCharacter, restOfTactId) {
        return createAstNode({
            kind: "id",
            text: firstTactIdCharacter.sourceString + restOfTactId.sourceString,
            loc: createRef(this),
        });
    },
    funcId(firstFuncIdCharacter, restOfFuncId) {
        return createAstNode({
            kind: "func_id",
            text: firstFuncIdCharacter.sourceString + restOfFuncId.sourceString,
            loc: createRef(this),
        });
    },
    null(_nullKwd) {
        return createAstNode({ kind: "null", loc: createRef(this) });
    },
    stringLiteral(_startQuotationMark, string, _endQuotationMark) {
        return createAstNode({
            kind: "string",
            value: string.sourceString,
            loc: createRef(this),
        });
    },
    ExpressionAdd_add(left, _plus, right) {
        return createAstNode({
            kind: "op_binary",
            op: "+",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionAdd_sub(left, _minus, right) {
        return createAstNode({
            kind: "op_binary",
            op: "-",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionMul_div(left, _slash, right) {
        return createAstNode({
            kind: "op_binary",
            op: "/",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionMul_mul(left, _star, right) {
        return createAstNode({
            kind: "op_binary",
            op: "*",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionMul_rem(left, _percent, right) {
        return createAstNode({
            kind: "op_binary",
            op: "%",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionEquality_eq(left, _equalsEquals, right) {
        return createAstNode({
            kind: "op_binary",
            op: "==",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionEquality_not(left, _bangEquals, right) {
        return createAstNode({
            kind: "op_binary",
            op: "!=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionCompare_gt(left, _rangle, right) {
        return createAstNode({
            kind: "op_binary",
            op: ">",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionCompare_gte(left, _rangleEquals, right) {
        return createAstNode({
            kind: "op_binary",
            op: ">=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionCompare_lt(left, _langle, right) {
        return createAstNode({
            kind: "op_binary",
            op: "<",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionCompare_lte(left, _langleEquals, right) {
        return createAstNode({
            kind: "op_binary",
            op: "<=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionOr_or(left, _pipePipe, right) {
        return createAstNode({
            kind: "op_binary",
            op: "||",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionAnd_and(left, _ampersandAmpersand, right) {
        return createAstNode({
            kind: "op_binary",
            op: "&&",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseShift_shr(left, _rangleRangle, right) {
        return createAstNode({
            kind: "op_binary",
            op: ">>",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseShift_shl(left, _langleLangle, right) {
        return createAstNode({
            kind: "op_binary",
            op: "<<",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseAnd_bitwiseAnd(left, _ampersand, right) {
        return createAstNode({
            kind: "op_binary",
            op: "&",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseOr_bitwiseOr(left, _pipe, right) {
        return createAstNode({
            kind: "op_binary",
            op: "|",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseXor_bitwiseXor(left, _caret, right) {
        return createAstNode({
            kind: "op_binary",
            op: "^",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },

    // Unary
    ExpressionUnary_plus(_plus, operand) {
        return createAstNode({
            kind: "op_unary",
            op: "+",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionUnary_minus(_minus, operand) {
        return createAstNode({
            kind: "op_unary",
            op: "-",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionUnary_not(_bang, operand) {
        return createAstNode({
            kind: "op_unary",
            op: "!",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionUnary_bitwiseNot(_tilde, operand) {
        return createAstNode({
            kind: "op_unary",
            op: "~",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionParens(_lparen, expression, _rparen) {
        return expression.astOfExpression();
    },
    ExpressionUnboxNotNull(operand, _bangBang) {
        return createAstNode({
            kind: "op_unary",
            op: "!!",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },

    ExpressionFieldAccess(source, _dot, fieldId) {
        return createAstNode({
            kind: "field_access",
            aggregate: source.astOfExpression(),
            field: fieldId.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionMethodCall(source, _dot, methodId, methodArguments) {
        return createAstNode({
            kind: "method_call",
            self: source.astOfExpression(),
            method: methodId.astOfExpression(),
            args: methodArguments.astsOfList(),
            loc: createRef(this),
        });
    },
    ExpressionStaticCall(functionId, functionArguments) {
        return createAstNode({
            kind: "static_call",
            function: functionId.astOfExpression(),
            args: functionArguments.astsOfList(),
            loc: createRef(this),
        });
    },
    ExpressionStructInstance(
        typeId,
        _lbrace,
        structFields,
        optTrailingComma,
        _rbrace,
    ) {
        if (
            structFields.source.contents === "" &&
            optTrailingComma.sourceString === ","
        ) {
            throwSyntaxError(
                "Empty parameter list should not have a dangling comma.",
                createRef(optTrailingComma),
            );
        }

        return createAstNode({
            kind: "struct_instance",
            type: typeId.astOfType(),
            args: structFields
                .asIteration()
                .children.map((d) => d.astOfDeclaration()),
            loc: createRef(this),
        });
    },
    ExpressionInitOf(_initOfKwd, contractId, initArguments) {
        return createAstNode({
            kind: "init_of",
            contract: contractId.astOfExpression(),
            args: initArguments.astsOfList(),
            loc: createRef(this),
        });
    },

    // Ternary conditional
    ExpressionConditional_ternary(
        condition,
        _questionMark,
        thenExpression,
        _colon,
        elseExpression,
    ) {
        return createAstNode({
            kind: "conditional",
            condition: condition.astOfExpression(),
            thenBranch: thenExpression.astOfExpression(),
            elseBranch: elseExpression.astOfExpression(),
            loc: createRef(this),
        });
    },
});

export function parse(
    src: string,
    path: string,
    origin: ItemOrigin,
): AstModule {
    return inFile(path, () => {
        const matchResult = tactGrammar.match(src);
        if (matchResult.failed()) {
            throwParseError(matchResult, path, origin);
        }
        ctx = { origin };
        try {
            return semantics(matchResult).astOfModule();
        } finally {
            ctx = null;
        }
    });
}

export function parseExpression(sourceCode: string): AstExpression {
    const matchResult = tactGrammar.match(sourceCode, "Expression");
    if (matchResult.failed()) {
        throwParseError(matchResult, "", "user");
    }
    ctx = { origin: "user" };
    return semantics(matchResult).astOfExpression();
}

export function parseImports(
    src: string,
    path: string,
    origin: ItemOrigin,
): string[] {
    return inFile(path, () => {
        const matchResult = tactGrammar.match(src, "JustImports");
        if (matchResult.failed()) {
            throwParseError(matchResult, path, origin);
        }
        ctx = { origin };
        try {
            const imports: AstImport[] =
                semantics(matchResult).astOfJustImports();
            return imports.map((imp) => imp.path.value);
        } finally {
            ctx = null;
        }
    });
}
