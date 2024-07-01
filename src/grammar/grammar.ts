import {
    Interval as RawInterval,
    Node,
    IterationNode,
    NonterminalNode,
    grammar,
    Grammar,
} from "ohm-js";
import tactGrammar from "./grammar.ohm-bundle";
import {
    ASTAugmentedAssignOperation,
    ASTConstantAttribute,
    ASTContractAttribute,
    ASTExpression,
    ASTFunctionAttribute,
    ASTNode,
    AstModule,
    ASTReceiveType,
    ASTString,
    ASTTypeRef,
    createNode,
    AstImport,
} from "./ast";
import { throwParseError, throwCompilationError } from "../errors";
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

export function inFile<T>(path: string, callback: () => T) {
    currentFile = path;
    const r = callback();
    currentFile = null;
    return r;
}

export function createRef(s: Node): SrcInfo {
    return new SrcInfo(s.source, currentFile, ctx!.origin);
}

// helper to unwrap optional grammar elements (marked with "?")
// ohm-js represents those essentially as lists (IterationNodes)
function unwrapOptNode<T>(
    optional: IterationNode,
    f: (n: Node) => T,
): T | null {
    const optNode = optional.children[0];
    return optNode ? f(optNode) : null;
}

const semantics = tactGrammar.createSemantics();

semantics.addOperation<ASTNode>("astOfModule", {
    Module(imports, items) {
        return createNode({
            kind: "module",
            imports: imports.children.map((item) => item.astOfImport()),
            entries: items.children.map((item) => item.astOfModuleItem()),
        });
    },
});

semantics.addOperation<ASTNode>("astOfImport", {
    Import(_importKwd, path, _semicolon) {
        const pathAST = path.astOfExpression() as ASTString;
        if (pathAST.value.indexOf("\\") >= 0) {
            throwCompilationError(
                'Import path can\'t contain "\\"',
                createRef(path),
            );
        }
        return createNode({
            kind: "import",
            path: pathAST,
            ref: createRef(this),
        });
    },
});

semantics.addOperation<AstImport[]>("astOfJustImports", {
    JustImports(imports, _restOfInput) {
        return imports.children.map((item) => item.astOfImport());
    },
});

semantics.addOperation<ASTNode>("astOfModuleItem", {
    PrimitiveTypeDecl(_primitive_kwd, typeId, _semicolon) {
        checkVariableName(typeId.sourceString, createRef(typeId));
        return createNode({
            kind: "primitive_type_decl",
            name: typeId.astOfType(),
            ref: createRef(this),
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
        return createNode({
            kind: "native_function_decl",
            attributes: funAttributes.children.map((a) =>
                a.astOfFunctionAttributes(),
            ),
            name: tactId.astOfExpression(),
            nativeName: funcId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            args: params.astsOfList(),
            ref: createRef(this),
        });
    },
    StructDecl_regular(_structKwd, typeId, _lbrace, fields, _rbrace) {
        checkVariableName(typeId.sourceString, createRef(typeId));
        return createNode({
            kind: "def_struct",
            name: typeId.astOfType(),
            fields: fields.astsOfList(),
            prefix: null,
            message: false,
            ref: createRef(this),
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
        return createNode({
            kind: "def_struct",
            name: typeId.astOfType(),
            fields: fields.astsOfList(),
            prefix: unwrapOptNode(optIntMsgId, (number) =>
                Number(bigintOfIntLiteral(number)),
            ),
            message: true,
            ref: createRef(this),
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
        return createNode({
            kind: "def_contract",
            name: contractId.astOfExpression(),
            attributes: attributes.children.map((ca) =>
                ca.astOfContractAttributes(),
            ),
            declarations: contractItems.children.map((item) =>
                item.astOfItem(),
            ),
            traits: optInheritedTraits.children[0]?.astsOfList() ?? [],
            ref: createRef(this),
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
        return createNode({
            kind: "def_trait",
            name: traitId.astOfExpression(),
            attributes: attributes.children.map((ca) =>
                ca.astOfContractAttributes(),
            ),
            declarations: traitItems.children.map((item) => item.astOfItem()),
            traits: optInheritedTraits.children[0]?.astsOfList() ?? [],
            ref: createRef(this),
        });
    },
    ModuleFunction(fun) {
        return fun.astOfItem();
    },
    ModuleConstant(constant) {
        return constant.astOfItem();
    },
});

// top-level (module-level), contract or trait items:
// constant declarations/definitions, functions, receivers,
// getters, etc.
semantics.addOperation<ASTNode>("astOfItem", {
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
        ) as ASTConstantAttribute[];
        checkConstAttributes(false, attributes, createRef(this));
        return createNode({
            kind: "def_constant",
            name: constId.astOfExpression(),
            type: constType.astOfType(),
            value: initExpr.astOfExpression(),
            attributes,
            ref: createRef(this),
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
        ) as ASTConstantAttribute[];
        checkConstAttributes(true, attributes, createRef(this));
        return createNode({
            kind: "def_constant",
            name: constId.astOfExpression(),
            type: constType.astOfType(),
            value: null,
            attributes,
            ref: createRef(this),
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
        ) as ASTFunctionAttribute[];
        checkVariableName(funId.sourceString, createRef(funId));
        checkFunctionAttributes(false, attributes, createRef(this));
        return createNode({
            kind: "function_def",
            attributes,
            name: funId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            args: funParameters.astsOfList(),
            statements: funBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        ) as ASTFunctionAttribute[];
        checkVariableName(funId.sourceString, createRef(funId));
        checkFunctionAttributes(true, attributes, createRef(this));
        return createNode({
            kind: "function_def",
            attributes,
            name: funId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            args: funParameters.astsOfList(),
            statements: null,
            ref: createRef(this),
        });
    },
    ContractInit(_initKwd, initParameters, _lbrace, initBody, _rbrace) {
        return createNode({
            kind: "def_init_function",
            args: initParameters.astsOfList(),
            statements: initBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        const optParam = optParameter.children[0];
        const selector: ASTReceiveType = optParam
            ? {
                  kind: "internal-simple",
                  arg: optParam.astOfDeclaration(),
              }
            : { kind: "internal-fallback" };
        return createNode({
            kind: "def_receive",
            selector,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        return createNode({
            kind: "def_receive",
            selector: {
                kind: "internal-comment",
                comment: comment.astOfExpression(),
            },
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        return createNode({
            kind: "def_receive",
            selector: { kind: "bounce", arg: parameter.astOfDeclaration() },
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        const optParam = optParameter.children[0];
        const selector: ASTReceiveType = optParam
            ? {
                  kind: "external-simple",
                  arg: optParam.astOfDeclaration(),
              }
            : { kind: "external-fallback" };
        return createNode({
            kind: "def_receive",
            selector,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        return createNode({
            kind: "def_receive",
            selector: {
                kind: "external-comment",
                comment: comment.astOfExpression(),
            },
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
        });
    },
});

semantics.addOperation<ASTFunctionAttribute>("astOfFunctionAttributes", {
    FunctionAttribute_getter(_) {
        return { type: "get", ref: createRef(this) };
    },
    FunctionAttribute_extends(_) {
        return { type: "extends", ref: createRef(this) };
    },
    FunctionAttribute_mutates(_) {
        return { type: "mutates", ref: createRef(this) };
    },
    FunctionAttribute_override(_) {
        return { type: "overrides", ref: createRef(this) };
    },
    FunctionAttribute_inline(_) {
        return { type: "inline", ref: createRef(this) };
    },
    FunctionAttribute_virtual(_) {
        return { type: "virtual", ref: createRef(this) };
    },
    FunctionAttribute_abstract(_) {
        return { type: "abstract", ref: createRef(this) };
    },
});

semantics.addOperation<ASTConstantAttribute>("astOfConstAttribute", {
    ConstantAttribute_override(_) {
        return { type: "overrides", ref: createRef(this) };
    },
    ConstantAttribute_virtual(_) {
        return { type: "virtual", ref: createRef(this) };
    },
    ConstantAttribute_abstract(_) {
        return { type: "abstract", ref: createRef(this) };
    },
});

semantics.addOperation<ASTNode[]>("astsOfList", {
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
            throwCompilationError(
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
            throwCompilationError(
                "Empty argument list should not have a dangling comma.",
                createRef(optTrailingComma),
            );
        }
        return args.asIteration().children.map((arg) => arg.astOfExpression());
    },
});

semantics.addOperation<ASTContractAttribute>("astOfContractAttributes", {
    ContractAttribute_interface(_interface, _lparen, interfaceName, _rparen) {
        return {
            type: "interface",
            name: interfaceName.astOfExpression(),
            ref: createRef(this),
        };
    },
});

semantics.addOperation<ASTNode>("astOfDeclaration", {
    FieldDecl(
        id,
        _colon,
        type,
        _optAs,
        optStorageType,
        _optEq,
        optInitializer,
    ) {
        return createNode({
            kind: "def_field",
            name: id.astOfExpression(),
            type: type.astOfType() as ASTTypeRef,
            as: unwrapOptNode(optStorageType, (t) => t.astOfExpression()),
            init: unwrapOptNode(optInitializer, (e) => e.astOfExpression()),
            ref: createRef(this),
        });
    },
    Parameter(id, _colon, type) {
        checkVariableName(id.sourceString, createRef(id));
        return createNode({
            kind: "def_argument",
            name: id.astOfExpression(),
            type: type.astOfType(),
            ref: createRef(this),
        });
    },
    StructFieldInitializer_full(fieldId, _colon, initializer) {
        return createNode({
            kind: "new_parameter",
            name: fieldId.astOfExpression(),
            exp: initializer.astOfExpression(),
            ref: createRef(this),
        });
    },
    StructFieldInitializer_punned(fieldId) {
        return createNode({
            kind: "new_parameter",
            name: fieldId.astOfExpression(),
            exp: fieldId.astOfExpression(),
            ref: createRef(this),
        });
    },
});

// Statements
semantics.addOperation<ASTNode>("astOfStatement", {
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

        return createNode({
            kind: "statement_let",
            name: id.astOfExpression(),
            type: unwrapOptNode(optType, (t) => t.astOfType()),
            expression: expression.astOfExpression(),
            ref: createRef(this),
        });
    },
    StatementReturn(_returnKwd, optExpression, _optSemicolonIfLastStmtInBlock) {
        return createNode({
            kind: "statement_return",
            expression: unwrapOptNode(optExpression, (e) =>
                e.astOfExpression(),
            ),
            ref: createRef(this),
        });
    },
    StatementExpression(expression, _optSemicolonIfLastStmtInBlock) {
        return createNode({
            kind: "statement_expression",
            expression: expression.astOfExpression(),
            ref: createRef(this),
        });
    },
    StatementAssign(
        lvalue,
        operator,
        expression,
        _optSemicolonIfLastStmtInBlock,
    ) {
        if (operator.sourceString === "=") {
            return createNode({
                kind: "statement_assign",
                path: lvalue.astOfExpression(),
                expression: expression.astOfExpression(),
                ref: createRef(this),
            });
        } else {
            let op: ASTAugmentedAssignOperation;
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
                    throw "Internal compiler error: unreachable augmented assignment operator. Please report at https://github.com/tact-lang/tact/issues";
            }
            return createNode({
                kind: "statement_augmentedassign",
                path: lvalue.astOfExpression(),
                op,
                expression: expression.astOfExpression(),
                ref: createRef(this),
            });
        }
    },
    StatementCondition_noElse(_ifKwd, condition, _lbrace, thenBlock, _rbrace) {
        return createNode({
            kind: "statement_condition",
            expression: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: null,
            elseif: null,
            ref: createRef(this),
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
        return createNode({
            kind: "statement_condition",
            expression: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: elseBlock.children.map((s) => s.astOfStatement()),
            elseif: null,
            ref: createRef(this),
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
        return createNode({
            kind: "statement_condition",
            expression: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: null,
            elseif: elseifClause.astOfStatement(),
            ref: createRef(this),
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
        return createNode({
            kind: "statement_while",
            condition: condition.astOfExpression(),
            statements: loopBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        return createNode({
            kind: "statement_repeat",
            iterations: iterations.astOfExpression(),
            statements: loopBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        return createNode({
            kind: "statement_until",
            condition: condition.astOfExpression(),
            statements: loopBody.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
        });
    },
    StatementTry_noCatch(_tryKwd, _lbraceTry, tryBlock, _rbraceTry) {
        return createNode({
            kind: "statement_try",
            statements: tryBlock.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        return createNode({
            kind: "statement_try_catch",
            statements: tryBlock.children.map((s) => s.astOfStatement()),
            catchName: exitCodeId.astOfExpression(),
            catchStatements: catchBlock.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
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
        return createNode({
            kind: "statement_foreach",
            keyName: keyId.astOfExpression(),
            valueName: valueId.astOfExpression(),
            map: mapId.astOfExpression(),
            statements: foreachBlock.children.map((s) => s.astOfStatement()),
            ref: createRef(this),
        });
    },
});

semantics.addOperation<ASTNode>("astOfType", {
    typeId(firstTactTypeIdCharacter, restOfTactTypeId) {
        return createNode({
            kind: "id",
            text:
                firstTactTypeIdCharacter.sourceString +
                restOfTactTypeId.sourceString,
            ref: createRef(this),
        });
    },
    Type_optional(typeId, _questionMark) {
        return createNode({
            kind: "type_ref_simple",
            name: typeId.astOfType(),
            optional: true,
            ref: createRef(this),
        });
    },
    Type_regular(typeId) {
        return createNode({
            kind: "type_ref_simple",
            name: typeId.astOfType(),
            optional: false,
            ref: createRef(this),
        });
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
        return createNode({
            kind: "type_ref_map",
            key: keyTypeId.astOfType(),
            keyAs: unwrapOptNode(optKeyStorageType, (t) => t.astOfExpression()),
            value: valueTypeId.astOfType(),
            valueAs: unwrapOptNode(optValueStorageType, (t) =>
                t.astOfExpression(),
            ),
            ref: createRef(this),
        });
    },
    Type_bounced(_bouncedKwd, _langle, typeId, _rangle) {
        return createNode({
            kind: "type_ref_bounced",
            name: typeId.astOfType(),
            ref: createRef(this),
        });
    },
});

// handles binary, octal, decimal and hexadecimal integer literals
function bigintOfIntLiteral(litString: NonterminalNode): bigint {
    return BigInt(litString.sourceString.replaceAll("_", ""));
}

// Expressions
semantics.addOperation<ASTNode>("astOfExpression", {
    // Literals
    integerLiteral(number) {
        return createNode({
            kind: "number",
            value: bigintOfIntLiteral(number),
            ref: createRef(this),
        }); // Parses dec, hex, and bin numbers
    },
    boolLiteral(boolValue) {
        return createNode({
            kind: "boolean",
            value: boolValue.sourceString === "true",
            ref: createRef(this),
        });
    },
    id(firstTactIdCharacter, restOfTactId) {
        return createNode({
            kind: "id",
            text: firstTactIdCharacter.sourceString + restOfTactId.sourceString,
            ref: createRef(this),
        });
    },
    funcId(firstFuncIdCharacter, restOfFuncId) {
        return createNode({
            kind: "func_id",
            text: firstFuncIdCharacter.sourceString + restOfFuncId.sourceString,
            ref: createRef(this),
        });
    },
    null(_nullKwd) {
        return createNode({ kind: "null", ref: createRef(this) });
    },
    stringLiteral(_startQuotationMark, string, _endQuotationMark) {
        return createNode({
            kind: "string",
            value: string.sourceString,
            ref: createRef(this),
        });
    },
    ExpressionAdd_add(left, _plus, right) {
        return createNode({
            kind: "op_binary",
            op: "+",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionAdd_sub(left, _minus, right) {
        return createNode({
            kind: "op_binary",
            op: "-",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionMul_div(left, _slash, right) {
        return createNode({
            kind: "op_binary",
            op: "/",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionMul_mul(left, _star, right) {
        return createNode({
            kind: "op_binary",
            op: "*",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionMul_rem(left, _percent, right) {
        return createNode({
            kind: "op_binary",
            op: "%",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionEquality_eq(left, _equalsEquals, right) {
        return createNode({
            kind: "op_binary",
            op: "==",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionEquality_not(left, _bangEquals, right) {
        return createNode({
            kind: "op_binary",
            op: "!=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionCompare_gt(left, _rangle, right) {
        return createNode({
            kind: "op_binary",
            op: ">",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionCompare_gte(left, _rangleEquals, right) {
        return createNode({
            kind: "op_binary",
            op: ">=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionCompare_lt(left, _langle, right) {
        return createNode({
            kind: "op_binary",
            op: "<",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionCompare_lte(left, _langleEquals, right) {
        return createNode({
            kind: "op_binary",
            op: "<=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionOr_or(left, _pipePipe, right) {
        return createNode({
            kind: "op_binary",
            op: "||",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionAnd_and(left, _ampersandAmpersand, right) {
        return createNode({
            kind: "op_binary",
            op: "&&",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionBitwiseShift_shr(left, _rangleRangle, right) {
        return createNode({
            kind: "op_binary",
            op: ">>",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionBitwiseShift_shl(left, _langleLangle, right) {
        return createNode({
            kind: "op_binary",
            op: "<<",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionBitwiseAnd_bitwiseAnd(left, _ampersand, right) {
        return createNode({
            kind: "op_binary",
            op: "&",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionBitwiseOr_bitwiseOr(left, _pipe, right) {
        return createNode({
            kind: "op_binary",
            op: "|",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionBitwiseXor_bitwiseXor(left, _caret, right) {
        return createNode({
            kind: "op_binary",
            op: "^",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            ref: createRef(this),
        });
    },

    // Unary
    ExpressionUnary_plus(_plus, operand) {
        return createNode({
            kind: "op_unary",
            op: "+",
            right: operand.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionUnary_minus(_minus, operand) {
        return createNode({
            kind: "op_unary",
            op: "-",
            right: operand.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionUnary_not(_bang, operand) {
        return createNode({
            kind: "op_unary",
            op: "!",
            right: operand.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionUnary_bitwiseNot(_tilde, operand) {
        return createNode({
            kind: "op_unary",
            op: "~",
            right: operand.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionParens(_lparen, expression, _rparen) {
        return expression.astOfExpression();
    },
    ExpressionUnboxNotNull(operand, _bangBang) {
        return createNode({
            kind: "op_unary",
            op: "!!",
            right: operand.astOfExpression(),
            ref: createRef(this),
        });
    },

    ExpressionFieldAccess(source, _dot, fieldId) {
        return createNode({
            kind: "op_field",
            src: source.astOfExpression(),
            name: fieldId.astOfExpression(),
            ref: createRef(this),
        });
    },
    ExpressionMethodCall(source, _dot, methodId, methodArguments) {
        return createNode({
            kind: "op_call",
            src: source.astOfExpression(),
            name: methodId.astOfExpression(),
            args: methodArguments.astsOfList(),
            ref: createRef(this),
        });
    },
    ExpressionStaticCall(functionId, functionArguments) {
        return createNode({
            kind: "op_static_call",
            name: functionId.astOfExpression(),
            args: functionArguments.astsOfList(),
            ref: createRef(this),
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
            throwCompilationError(
                "Empty parameter list should not have a dangling comma.",
                createRef(optTrailingComma),
            );
        }

        return createNode({
            kind: "op_new",
            type: typeId.astOfType(),
            args: structFields
                .asIteration()
                .children.map((d) => d.astOfDeclaration()),
            ref: createRef(this),
        });
    },
    ExpressionInitOf(_initOfKwd, contractId, initArguments) {
        return createNode({
            kind: "init_of",
            name: contractId.astOfExpression(),
            args: initArguments.astsOfList(),
            ref: createRef(this),
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
        return createNode({
            kind: "conditional",
            condition: condition.astOfExpression(),
            thenBranch: thenExpression.astOfExpression(),
            elseBranch: elseExpression.astOfExpression(),
            ref: createRef(this),
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

export function parseExpression(sourceCode: string): ASTExpression {
    const matchResult = tactGrammar.match(sourceCode, "Expression");
    if (matchResult.failed()) {
        throwParseError(matchResult, "", "user");
    }
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
