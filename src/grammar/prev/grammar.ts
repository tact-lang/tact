import type { Node, IterationNode, NonterminalNode } from "ohm-js";
import tactGrammar from "./grammar.ohm-bundle";
import { throwInternalCompilerError } from "../../error/errors";
import type * as A from "../../ast/ast";
import type { FactoryAst } from "../../ast/ast-helpers";
import type { SrcInfo } from "../src-info";
import { displayToString } from "../../error/display-to-string";
import type { ParserErrors } from "./parser-error";
import { parserErrorSchema } from "./parser-error";
import { getSrcInfoFromOhm } from "./src-info";
import type { ItemOrigin, Language, Source } from "../../imports/source";
import { emptyPath, fromString } from "../../imports/path";

type Context = {
    origin: ItemOrigin | null;
    currentFile: string | null;
    createNode: FactoryAst["createNode"] | null;
    errorTypes: ParserErrors | null;
};

const defaultContext: Context = Object.freeze({
    createNode: null,
    currentFile: null,
    origin: null,
    errorTypes: null,
});

let context: Context = defaultContext;

const withContext = <T>(ctx: Context, callback: () => T): T => {
    try {
        context = ctx;
        return callback();
    } finally {
        context = defaultContext;
    }
};

function createRef(s: Node): SrcInfo {
    if (context.origin === null) {
        throwInternalCompilerError("Parser context was not initialized");
    }

    return getSrcInfoFromOhm(s.source, context.currentFile, context.origin);
}

const createNode: FactoryAst["createNode"] = (...args) => {
    if (context.createNode === null) {
        throwInternalCompilerError("Parser context was not initialized");
    }

    return context.createNode(...args);
};

const err = () => {
    if (context.errorTypes === null) {
        throwInternalCompilerError("Parser context was not initialized");
    }

    return context.errorTypes;
};

// helper to unwrap optional grammar elements (marked with "?")
// ohm-js represents those essentially as lists (IterationNodes)
function unwrapOptNode<T>(
    optional: IterationNode,
    f: (n: Node) => T,
): T | null {
    const optNode = optional.children[0] as Node | undefined;
    return optNode !== undefined ? f(optNode) : null;
}

function checkVariableName(name: string, loc: SrcInfo) {
    if (name.startsWith("__gen")) {
        err().reservedVarPrefix("__gen")(loc);
    }
    if (name.startsWith("__tact")) {
        err().reservedVarPrefix("__tact")(loc);
    }
}

const checkAttributes =
    (kind: "constant" | "function") =>
    (
        isAbstract: boolean,
        attributes: (A.AstConstantAttribute | A.AstFunctionAttribute)[],
        loc: SrcInfo,
    ) => {
        const { duplicate, tooAbstract, notAbstract } = err()[kind];
        const k: Set<string> = new Set();
        for (const a of attributes) {
            if (k.has(a.type)) {
                duplicate(a.type)(a.loc);
            }
            k.add(a.type);
        }
        if (isAbstract && !k.has("abstract")) {
            notAbstract()(loc);
        }
        if (!isAbstract && k.has("abstract")) {
            tooAbstract()(loc);
        }
    };

const checkConstAttributes = checkAttributes("constant");

const checkFunctionAttributes = checkAttributes("function");

const semantics = tactGrammar.createSemantics();

semantics.addOperation<A.AstNode>("astOfModule", {
    Module(imports, items) {
        return createNode({
            kind: "module",
            imports: imports.children.map((item) => item.astOfImport()),
            items: items.children.map((item) => item.astOfModuleItem()),
        });
    },
});

const detectLanguage = (path: string): Language | undefined => {
    if (path.endsWith(".fc") || path.endsWith(".func")) {
        return "func";
    }

    if (path.endsWith(".tact")) {
        return "tact";
    }

    return undefined;
};

const guessExtension = (
    importText: string,
): { language: Language; guessedPath: string } => {
    const language = detectLanguage(importText);
    if (language) {
        return { guessedPath: importText, language };
    } else {
        return { guessedPath: `${importText}.tact`, language: "tact" };
    }
};

const stdlibPrefix = "@stdlib/";

function parseImportString(importText: string, loc: SrcInfo): A.ImportPath {
    if (importText.endsWith("/")) {
        err().noFolderImports()(loc);
    }

    if (importText.includes("\\")) {
        err().importWithBackslash()(loc);
    }

    const { guessedPath, language } = guessExtension(importText);

    if (guessedPath.startsWith(stdlibPrefix)) {
        const path = fromString(guessedPath.substring(stdlibPrefix.length));
        if (path.stepsUp !== 0) {
            err().importWithBackslash()(loc);
        }
        return { path, type: "stdlib", language };
    } else if (guessedPath.startsWith("./") || guessedPath.startsWith("../")) {
        return { path: fromString(guessedPath), type: "relative", language };
    } else {
        err().invalidImport()(loc);
        return { path: emptyPath, type: "relative", language: "tact" };
    }
}

semantics.addOperation<A.AstNode>("astOfImport", {
    Import(_importKwd, path, _semicolon) {
        const stringLiteral = path.astOfExpression() as A.AstString;
        const parsedString: string = JSON.parse(`"${stringLiteral.value}"`);
        const loc = createRef(this);
        return createNode({
            kind: "import",
            importPath: parseImportString(parsedString, loc),
            loc,
        });
    },
});

semantics.addOperation<A.AstImport[]>("astOfJustImports", {
    JustImports(imports, _restOfInput) {
        return imports.children.map((item) => item.astOfImport());
    },
});

semantics.addOperation<A.AstNode>("astOfModuleItem", {
    PrimitiveTypeDecl(_primitive_kwd, typeId, _semicolon) {
        checkVariableName(typeId.sourceString, createRef(typeId));
        return createNode({
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
        return createNode({
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
        return createNode({
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
        return createNode({
            kind: "message_decl",
            name: typeId.astOfType(),
            fields: fields.astsOfList(),
            opcode: unwrapOptNode(optIntMsgId, (msgId) =>
                msgId.astOfExpression(),
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
        return createNode({
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
        return createNode({
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
        const astConstDef: A.AstConstantDef = constant.astOfItem();
        if (astConstDef.attributes.length !== 0) {
            err().topLevelConstantWithAttribute()(
                astConstDef.attributes[0]!.loc,
            );
        }
        return astConstDef;
    },
});

// top-level (module-level), contract or trait items:
// constant declarations/definitions, functions, receivers,
// getters, etc.
semantics.addOperation<A.AstNode>("astOfItem", {
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
        ) as A.AstConstantAttribute[];
        checkConstAttributes(false, attributes, createRef(this));
        return createNode({
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
        ) as A.AstConstantAttribute[];
        checkConstAttributes(true, attributes, createRef(this));
        return createNode({
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
        ) as A.AstFunctionAttribute[];
        checkVariableName(funId.sourceString, createRef(funId));
        checkFunctionAttributes(false, attributes, createRef(this));
        return createNode({
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
        ) as A.AstFunctionAttribute[];
        checkVariableName(funId.sourceString, createRef(funId));
        checkFunctionAttributes(false, attributes, createRef(this));
        return createNode({
            kind: "asm_function_def",
            shuffle,
            attributes,
            name: funId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            params: funParameters.astsOfList(),
            instructions: asmInstructions.children.map((s) =>
                s.astOfAsmInstruction(),
            ),
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
        ) as A.AstFunctionAttribute[];
        checkVariableName(funId.sourceString, createRef(funId));
        checkFunctionAttributes(true, attributes, createRef(this));
        return createNode({
            kind: "function_decl",
            attributes,
            name: funId.astOfExpression(),
            return: unwrapOptNode(optReturnType, (t) => t.astOfType()),
            params: funParameters.astsOfList(),
            loc: createRef(this),
        });
    },
    ContractInit(_initKwd, initParameters, _lbrace, initBody, _rbrace) {
        return createNode({
            kind: "contract_init",
            params: initParameters.astsOfList(),
            statements: initBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_regular(
        receiveKwd,
        _lparen,
        optParameter,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        const optParam = optParameter.children[0] as Node | undefined;
        const subKind = optParam
            ? createNode({
                  kind: "simple",
                  param: optParam.astOfDeclaration(),
              })
            : createNode({ kind: "fallback" });
        return createNode({
            kind: "receiver",
            selector: createNode({
                kind: "internal",
                subKind: subKind as A.AstReceiverSubKind,
                loc: createRef(receiveKwd),
            }) as A.AstReceiverKind,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_comment(
        receiveKwd,
        _lparen,
        comment,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        return createNode({
            kind: "receiver",
            selector: createNode({
                kind: "internal",
                subKind: createNode({
                    kind: "comment",
                    comment: comment.astOfExpression(),
                }) as A.AstReceiverSubKind,
                loc: createRef(receiveKwd),
            }) as A.AstReceiverKind,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_bounced(
        bouncedKwd,
        _lparen,
        parameter,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        return createNode({
            kind: "receiver",
            selector: createNode({
                kind: "bounce",
                param: parameter.astOfDeclaration(),
                loc: createRef(bouncedKwd),
            }) as A.AstReceiverKind,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_externalRegular(
        externalKwd,
        _lparen,
        optParameter,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        const optParam = optParameter.children[0] as Node | undefined;
        const subKind = optParam
            ? createNode({
                  kind: "simple",
                  param: optParam.astOfDeclaration(),
              })
            : createNode({ kind: "fallback" });

        return createNode({
            kind: "receiver",
            selector: createNode({
                kind: "external",
                subKind: subKind as A.AstReceiverSubKind,
                loc: createRef(externalKwd),
            }) as A.AstReceiverKind,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    Receiver_externalComment(
        externalKwd,
        _lparen,
        comment,
        _rparen,
        _lbrace,
        receiverBody,
        _rbrace,
    ) {
        return createNode({
            kind: "receiver",
            selector: createNode({
                kind: "external",
                subKind: createNode({
                    kind: "comment",
                    comment: comment.astOfExpression(),
                }) as A.AstReceiverSubKind,
                loc: createRef(externalKwd),
            }) as A.AstReceiverKind,
            statements: receiverBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
});

// Beginnings of the possible future AST for Fift-asm
semantics.addOperation<string>("astOfAsmInstruction", {
    asmInstruction(word) {
        return word.sourceString;
    },
    AsmInstruction(instruction) {
        return instruction.astOfAsmInstruction();
    },
    AsmInstruction_custom(instruction) {
        return instruction.astOfAsmInstruction();
    },
    AsmInstruction_internal(
        _leftBracket,
        _ws1,
        instructions,
        _rightBracket,
        _ws2,
    ) {
        return [
            "[",
            instructions.children.map((s) => s.astOfAsmInstruction()).join(" "),
            "]",
        ].join(" ");
    },
    AsmInstruction_list(_lbrace, _ws1, instructions, _rbrace, _ws2) {
        return [
            "{",
            instructions.children.map((s) => s.astOfAsmInstruction()).join(" "),
            "}",
        ].join(" ");
    },
    AsmInstruction_listNoStateCheck(
        _lbrace,
        _ws1,
        instructions,
        _rbrace,
        _ws2,
    ) {
        return [
            "({)",
            instructions.children.map((s) => s.astOfAsmInstruction()).join(" "),
            "(})",
        ].join(" ");
    },
    AsmInstruction_string(
        startQuotationMarkWord,
        string,
        _endQuotationMark,
        _ws,
    ) {
        return `${startQuotationMarkWord.sourceString}${string.sourceString}"`;
    },
    AsmInstruction_tick(_singleQuote, _ws1, instruction) {
        return `' ${instruction.sourceString}`;
    },
    AsmInstruction_char(_word, _ws1, char, _ws2) {
        return `char ${char.sourceString}`;
    },
    AsmInstruction_hexLiteral(prefix, digits, optUnderscore, _rbrace, _ws) {
        const length = digits.numChildren;
        const underscore = unwrapOptNode(optUnderscore, (t) => t.sourceString);
        if (length > 128) {
            err().literalTooLong()(createRef(this));
        }
        return `${prefix.sourceString}${digits.sourceString}${underscore ?? ""}}`;
    },
    AsmInstruction_binLiteral(_prefix, digits, _rbrace, _ws) {
        const length = digits.numChildren;
        if (length > 128) {
            err().literalTooLong()(createRef(this));
        }
        return `b{${digits.sourceString}}`;
    },
});

semantics.addOperation<A.AstFunctionAttribute>("astOfFunctionAttributes", {
    FunctionAttribute_getter(_getKwd, _optLparen, optMethodId, _optRparen) {
        return {
            kind: "function_attribute",
            type: "get",
            methodId: unwrapOptNode(optMethodId, (e) => e.astOfExpression()),
            loc: createRef(this),
        };
    },
    FunctionAttribute_extends(_) {
        return {
            kind: "function_attribute",
            type: "extends",
            loc: createRef(this),
        };
    },
    FunctionAttribute_mutates(_) {
        return {
            kind: "function_attribute",
            type: "mutates",
            loc: createRef(this),
        };
    },
    FunctionAttribute_override(_) {
        return {
            kind: "function_attribute",
            type: "override",
            loc: createRef(this),
        };
    },
    FunctionAttribute_inline(_) {
        return {
            kind: "function_attribute",
            type: "inline",
            loc: createRef(this),
        };
    },
    FunctionAttribute_virtual(_) {
        return {
            kind: "function_attribute",
            type: "virtual",
            loc: createRef(this),
        };
    },
    FunctionAttribute_abstract(_) {
        return {
            kind: "function_attribute",
            type: "abstract",
            loc: createRef(this),
        };
    },
});

semantics.addOperation<{ args: A.AstNode[]; ret: A.AstNode[] }>(
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

semantics.addOperation<A.AstConstantAttribute>("astOfConstAttribute", {
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

semantics.addOperation<A.AstNode[]>("astsOfList", {
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
            err().extraneousComma()(createRef(optTrailingComma));
        }
        return params.asIteration().children.map((p) => p.astOfDeclaration());
    },
    Arguments(_lparen, args, optTrailingComma, _rparen) {
        if (
            args.source.contents === "" &&
            optTrailingComma.sourceString === ","
        ) {
            err().extraneousComma()(createRef(optTrailingComma));
        }
        return args.asIteration().children.map((arg) => arg.astOfExpression());
    },
});

semantics.addOperation<A.AstContractAttribute>("astOfContractAttributes", {
    ContractAttribute_interface(_interface, _lparen, interfaceName, _rparen) {
        return {
            type: "interface",
            name: interfaceName.astOfExpression(),
            loc: createRef(this),
        };
    },
});

semantics.addOperation<A.AstNode>("astOfDeclaration", {
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
            kind: "field_decl",
            name: id.astOfExpression(),
            type: type.astOfType() as A.AstType,
            as: unwrapOptNode(optStorageType, (t) => t.astOfExpression()),
            initializer: unwrapOptNode(optInitializer, (e) =>
                e.astOfExpression(),
            ),
            loc: createRef(this),
        });
    },
    Parameter(id, _colon, type) {
        checkVariableName(id.sourceString, createRef(id));
        return createNode({
            kind: "typed_parameter",
            name: id.astOfExpression(),
            type: type.astOfType(),
            loc: createRef(this),
        });
    },
    StructFieldInitializer_full(fieldId, _colon, initializer) {
        return createNode({
            kind: "struct_field_initializer",
            field: fieldId.astOfExpression(),
            initializer: initializer.astOfExpression(),
            loc: createRef(this),
        });
    },
    StructFieldInitializer_punned(fieldId) {
        return createNode({
            kind: "struct_field_initializer",
            field: fieldId.astOfExpression(),
            initializer: fieldId.astOfExpression(),
            loc: createRef(this),
        });
    },
});

// Statements
semantics.addOperation<A.AstNode>("astOfStatement", {
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
            loc: createRef(this),
        });
    },
    StatementReturn(_returnKwd, optExpression, _optSemicolonIfLastStmtInBlock) {
        return createNode({
            kind: "statement_return",
            expression: unwrapOptNode(optExpression, (e) =>
                e.astOfExpression(),
            ),
            loc: createRef(this),
        });
    },
    StatementExpression(expression, _optSemicolonIfLastStmtInBlock) {
        return createNode({
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
            return createNode({
                kind: "statement_assign",
                path: lvalue.astOfExpression(),
                expression: expression.astOfExpression(),
                loc: createRef(this),
            });
        } else {
            let op: A.AstAugmentedAssignOperation;
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
                case "||=":
                    op = "||";
                    break;
                case "&&=":
                    op = "&&";
                    break;
                case "<<=":
                    op = "<<";
                    break;
                case ">>=":
                    op = ">>";
                    break;
                default:
                    throwInternalCompilerError(
                        "Unreachable augmented assignment operator.",
                    );
            }
            return createNode({
                kind: "statement_augmentedassign",
                path: lvalue.astOfExpression(),
                op,
                expression: expression.astOfExpression(),
                loc: createRef(this),
            });
        }
    },
    StatementCondition_noElse(_ifKwd, condition, _lbrace, thenBlock, _rbrace) {
        return createNode({
            kind: "statement_condition",
            condition: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: null,
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
        return createNode({
            kind: "statement_condition",
            condition: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: elseBlock.children.map((s) => s.astOfStatement()),
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
        return createNode({
            kind: "statement_condition",
            condition: condition.astOfExpression(),
            trueStatements: thenBlock.children.map((s) => s.astOfStatement()),
            falseStatements: [elseifClause.astOfStatement()],
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
        return createNode({
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
        return createNode({
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
        return createNode({
            kind: "statement_until",
            condition: condition.astOfExpression(),
            statements: loopBody.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    StatementTry_noCatch(_tryKwd, _lbraceTry, tryBlock, _rbraceTry) {
        return createNode({
            kind: "statement_try",
            statements: tryBlock.children.map((s) => s.astOfStatement()),
            catchBlock: undefined,
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
        return createNode({
            kind: "statement_try",
            statements: tryBlock.children.map((s) => s.astOfStatement()),
            catchBlock: {
                catchName: exitCodeId.astOfExpression(),
                catchStatements: catchBlock.children.map((s) =>
                    s.astOfStatement(),
                ),
            },
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
        return createNode({
            kind: "statement_foreach",
            keyName: keyId.astOfExpression(),
            valueName: valueId.astOfExpression(),
            map: mapId.astOfExpression(),
            statements: foreachBlock.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
    StatementDestruct(
        _letKwd,
        typeId,
        _lparen,
        identifiers,
        endOfIdentifiers,
        _rparen,
        _equals,
        expression,
        _semicolon,
    ) {
        return createNode({
            kind: "statement_destruct",
            type: typeId.astOfType(),
            identifiers: identifiers
                .asIteration()
                .children.reduce((map, item) => {
                    const destructItem = item.astOfExpression();
                    if (map.has(destructItem.field.text)) {
                        err().duplicateField(destructItem.field.text)(
                            destructItem.loc,
                        );
                    }
                    map.set(destructItem.field.text, [
                        destructItem.field,
                        destructItem.name,
                    ]);
                    return map;
                }, new Map<string, [A.AstId, A.AstId]>()),
            ignoreUnspecifiedFields:
                endOfIdentifiers.astOfExpression().ignoreUnspecifiedFields,
            expression: expression.astOfExpression(),
            loc: createRef(this),
        });
    },
    StatementBlock(_lbrace, statements, _rbrace) {
        return createNode({
            kind: "statement_block",
            statements: statements.children.map((s) => s.astOfStatement()),
            loc: createRef(this),
        });
    },
});

semantics.addOperation<A.AstNode>("astOfType", {
    typeId(firstTactTypeIdCharacter, restOfTactTypeId) {
        return createNode({
            kind: "type_id",
            text:
                firstTactTypeIdCharacter.sourceString +
                restOfTactTypeId.sourceString,
            loc: createRef(this),
        });
    },
    Type_optional(typeId, _questionMark) {
        return createNode({
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
        return createNode({
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
        return createNode({
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

function baseOfIntLiteral(node: NonterminalNode): A.AstNumberBase {
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

function astOfNumber(node: Node): A.AstNode {
    return createNode({
        kind: "number",
        base: baseOfIntLiteral(node),
        value: bigintOfIntLiteral(node),
        loc: createRef(node),
    });
}

// Expressions
semantics.addOperation<A.AstNode>("astOfExpression", {
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
        return createNode({
            kind: "boolean",
            value: boolValue.sourceString === "true",
            loc: createRef(this),
        });
    },
    id(firstTactIdCharacter, restOfTactId) {
        return createNode({
            kind: "id",
            text: firstTactIdCharacter.sourceString + restOfTactId.sourceString,
            loc: createRef(this),
        });
    },
    funcId(firstFuncIdCharacter, restOfFuncId) {
        return createNode({
            kind: "func_id",
            text: firstFuncIdCharacter.sourceString + restOfFuncId.sourceString,
            loc: createRef(this),
        });
    },
    null(_nullKwd) {
        return createNode({ kind: "null", loc: createRef(this) });
    },
    stringLiteral(_startQuotationMark, string, _endQuotationMark) {
        return createNode({
            kind: "string",
            value: string.sourceString,
            loc: createRef(this),
        });
    },
    DestructItem_punned(id) {
        return createNode({
            kind: "destruct_mapping",
            field: id.astOfExpression(),
            name: id.astOfExpression(),
            loc: createRef(this),
        });
    },
    DestructItem_regular(idFrom, _colon, id) {
        return createNode({
            kind: "destruct_mapping",
            field: idFrom.astOfExpression(),
            name: id.astOfExpression(),
            loc: createRef(this),
        });
    },
    EndOfIdentifiers_regular(_comma) {
        return createNode({
            kind: "destruct_end",
            ignoreUnspecifiedFields: false,
            loc: createRef(this),
        });
    },
    EndOfIdentifiers_ignoreUnspecifiedFields(_comma, _dotDot) {
        return createNode({
            kind: "destruct_end",
            ignoreUnspecifiedFields: true,
            loc: createRef(this),
        });
    },
    ExpressionAdd_add(left, _plus, right) {
        return createNode({
            kind: "op_binary",
            op: "+",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionAdd_sub(left, _minus, right) {
        return createNode({
            kind: "op_binary",
            op: "-",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionMul_div(left, _slash, right) {
        return createNode({
            kind: "op_binary",
            op: "/",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionMul_mul(left, _star, right) {
        return createNode({
            kind: "op_binary",
            op: "*",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionMul_rem(left, _percent, right) {
        return createNode({
            kind: "op_binary",
            op: "%",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionEquality_eq(left, _equalsEquals, right) {
        return createNode({
            kind: "op_binary",
            op: "==",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionEquality_not(left, _bangEquals, right) {
        return createNode({
            kind: "op_binary",
            op: "!=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionCompare_gt(left, _rangle, right) {
        return createNode({
            kind: "op_binary",
            op: ">",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionCompare_gte(left, _rangleEquals, right) {
        return createNode({
            kind: "op_binary",
            op: ">=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionCompare_lt(left, _langle, right) {
        return createNode({
            kind: "op_binary",
            op: "<",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionCompare_lte(left, _langleEquals, right) {
        return createNode({
            kind: "op_binary",
            op: "<=",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionOr_or(left, _pipePipe, right) {
        return createNode({
            kind: "op_binary",
            op: "||",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionAnd_and(left, _ampersandAmpersand, right) {
        return createNode({
            kind: "op_binary",
            op: "&&",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseShift_shr(left, _rangleRangle, right) {
        return createNode({
            kind: "op_binary",
            op: ">>",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseShift_shl(left, _langleLangle, right) {
        return createNode({
            kind: "op_binary",
            op: "<<",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseAnd_bitwiseAnd(left, _ampersand, right) {
        return createNode({
            kind: "op_binary",
            op: "&",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseOr_bitwiseOr(left, _pipe, right) {
        return createNode({
            kind: "op_binary",
            op: "|",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionBitwiseXor_bitwiseXor(left, _caret, right) {
        return createNode({
            kind: "op_binary",
            op: "^",
            left: left.astOfExpression(),
            right: right.astOfExpression(),
            loc: createRef(this),
        });
    },

    // Unary
    ExpressionUnary_plus(_plus, operand) {
        return createNode({
            kind: "op_unary",
            op: "+",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionUnary_minus(_minus, operand) {
        return createNode({
            kind: "op_unary",
            op: "-",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionUnary_not(_bang, operand) {
        return createNode({
            kind: "op_unary",
            op: "!",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionUnary_bitwiseNot(_tilde, operand) {
        return createNode({
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
        return createNode({
            kind: "op_unary",
            op: "!!",
            operand: operand.astOfExpression(),
            loc: createRef(this),
        });
    },

    ExpressionFieldAccess(source, _dot, fieldId) {
        return createNode({
            kind: "field_access",
            aggregate: source.astOfExpression(),
            field: fieldId.astOfExpression(),
            loc: createRef(this),
        });
    },
    ExpressionMethodCall(source, _dot, methodId, methodArguments) {
        return createNode({
            kind: "method_call",
            self: source.astOfExpression(),
            method: methodId.astOfExpression(),
            args: methodArguments.astsOfList(),
            loc: createRef(this),
        });
    },
    ExpressionStaticCall(functionId, functionArguments) {
        return createNode({
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
            err().extraneousComma()(createRef(optTrailingComma));
        }

        return createNode({
            kind: "struct_instance",
            type: typeId.astOfType(),
            args: structFields
                .asIteration()
                .children.map((d) => d.astOfDeclaration()),
            loc: createRef(this),
        });
    },
    ExpressionInitOf(_initOfKwd, contractId, initArguments) {
        return createNode({
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
        return createNode({
            kind: "conditional",
            condition: condition.astOfExpression(),
            thenBranch: thenExpression.astOfExpression(),
            elseBranch: elseExpression.astOfExpression(),
            loc: createRef(this),
        });
    },
});

/**
 * @deprecated
 */
export const getParser = (ast: FactoryAst) => {
    const errorTypes = parserErrorSchema(displayToString);

    function parse({ code, origin, path }: Source): A.AstModule {
        return withContext(
            {
                currentFile: path,
                origin,
                createNode: ast.createNode,
                errorTypes,
            },
            () => {
                const matchResult = tactGrammar.match(code);
                if (matchResult.failed()) {
                    errorTypes.generic(matchResult, path, origin);
                }
                return semantics(matchResult).astOfModule();
            },
        );
    }

    function parseExpression(code: string): A.AstExpression {
        return withContext(
            {
                currentFile: null,
                origin: "user",
                createNode: ast.createNode,
                errorTypes,
            },
            () => {
                const matchResult = tactGrammar.match(code, "Expression");
                if (matchResult.failed()) {
                    errorTypes.generic(matchResult, "", "user");
                }
                return semantics(matchResult).astOfExpression();
            },
        );
    }

    function parseImports({ code, origin, path }: Source): A.AstImport[] {
        return withContext(
            {
                currentFile: path,
                origin,
                createNode: ast.createNode,
                errorTypes,
            },
            () => {
                const matchResult = tactGrammar.match(code, "JustImports");
                if (matchResult.failed()) {
                    errorTypes.generic(matchResult, path, origin);
                }
                return semantics(matchResult).astOfJustImports();
            },
        );
    }

    function parseStatement(code: string): A.AstStatement {
        return withContext(
            {
                currentFile: null,
                origin: "user",
                createNode: ast.createNode,
                errorTypes,
            },
            () => {
                const matchResult = tactGrammar.match(code, "Statement");
                if (matchResult.failed()) {
                    errorTypes.generic(matchResult, "", "user");
                }
                return semantics(matchResult).astOfStatement();
            },
        );
    }

    return {
        parse,
        parseExpression,
        parseImports,
        parseStatement,
    };
};
