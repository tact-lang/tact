import * as A from "./grammar/ast";
import { groupBy, intercalate, isUndefined } from "./utils/array";
import { makeVisitor } from "./utils/tricks";

//
// Types
//

export const ppAstTypeId = A.idText;

export const ppAstTypeIdWithStorage = (
    type: A.AstTypeId,
    storageType: A.AstId | null,
): string => {
    const alias = storageType ? ` as ${ppAstId(storageType)}` : "";
    return `${ppAstTypeId(type)}${alias}`;
};

export const ppAstMapType = ({
    keyType,
    keyStorageType,
    valueType,
    valueStorageType,
}: A.AstMapType): string => {
    const key = ppAstTypeIdWithStorage(keyType, keyStorageType);
    const value = ppAstTypeIdWithStorage(valueType, valueStorageType);
    return `map<${key}, ${value}>`;
};

export const ppAstBouncedMessageType = ({
    messageType,
}: A.AstBouncedMessageType): string => {
    return `bounced<${ppAstTypeId(messageType)}>`;
};

export const ppAstOptionalType = ({ typeArg }: A.AstOptionalType): string => {
    return `${ppAstType(typeArg)}?`;
};

export const ppAstType = makeVisitor<A.AstType>()({
    type_id: ppAstTypeId,
    map_type: ppAstMapType,
    bounced_message_type: ppAstBouncedMessageType,
    optional_type: ppAstOptionalType,
});

//
// Expressions
//

export const precedenceMap: Readonly<Record<A.AstBinaryOperation, number>> = {
    "||": 1,
    "&&": 2,
    "|": 3,
    "^": 4,
    "&": 5,
    "==": 6,
    "!=": 6,
    "<": 7,
    ">": 7,
    "<=": 7,
    ">=": 7,
    "+": 8,
    "-": 8,
    "*": 9,
    "/": 9,
    "%": 9,
    "<<": 11, // BUG?
    ">>": 11,
};

/**
 * Returns precedence used in unary/binary operations.
 * Lower number means higher precedence
 */
export const getPrecedence = makeVisitor<A.AstExpression>()({
    op_binary: ({ op }) => precedenceMap[op],
    conditional: () => 0,
    static_call: () => 0,
    method_call: () => 0,
    op_unary: () => 10,
    id: () => 11,
    field_access: () => 11,
    number: () => 11,
    boolean: () => 11,
    struct_instance: () => 11,
    null: () => 11,
    init_of: () => 11,
    string: () => 11,
});

export const ppAstStructFieldInit = (
    param: A.AstStructFieldInitializer,
): string => `${ppAstId(param.field)}: ${ppAstExpression(param.initializer)}`;

export const ppExprArgs: ExprPrinter<A.AstExpression[]> =
    (args) => (currPrecedence) => {
        return args.map((arg) => ppAstExpression(arg, currPrecedence)).join(", ");
    };

type ExprPrinter<T> = (expr: T) => (currPrecedence: number) => string;

export const ppAstOpBinary: ExprPrinter<A.AstOpBinary> =
    ({ left, op, right }) =>
    (currPrecedence) => {
        return `${ppAstExpression(left, currPrecedence)} ${op} ${ppAstExpression(right, currPrecedence)}`;
    };

export const ppAstOpUnary: ExprPrinter<A.AstOpUnary> =
    ({ op, operand }) =>
    (currPrecedence) => {
        return `${op}${ppAstExpression(operand, currPrecedence)}`;
    };

export const ppAstFieldAccess: ExprPrinter<A.AstFieldAccess> =
    ({ aggregate, field }) =>
    (currPrecedence) => {
        return `${ppAstExpression(aggregate, currPrecedence)}.${ppAstId(field)}`;
    };

export const ppAstMethodCall: ExprPrinter<A.AstMethodCall> =
    ({ self, method, args }) =>
    (currPrecedence) => {
        return `${ppAstExpression(self, currPrecedence)}.${ppAstId(method)}(${ppExprArgs(args)(currPrecedence)})`;
    };

export const ppAstStaticCall: ExprPrinter<A.AstStaticCall> =
    ({ function: func, args }) =>
    (currPrecedence) => {
        return `${ppAstId(func)}(${ppExprArgs(args)(currPrecedence)})`;
    };

export const ppAstInitOf: ExprPrinter<A.AstInitOf> =
    ({ contract, args }) =>
    (currPrecedence) => {
        return `initOf ${ppAstId(contract)}(${ppExprArgs(args)(currPrecedence)})`;
    };

export const ppAstConditional: ExprPrinter<A.AstConditional> =
    ({ condition, thenBranch, elseBranch }) =>
    (currPrecedence) => {
        return `${ppAstExpression(condition, currPrecedence)} ? ${ppAstExpression(thenBranch, currPrecedence)} : ${ppAstExpression(elseBranch, currPrecedence)}`;
    };

export const ppAstStructInstance = ({ type, args }: A.AstStructInstance) =>
    `${ppAstId(type)}{${args.map((x) => ppAstStructFieldInit(x)).join(", ")}}`;
export const ppAstNumber = A.astNumToString;
export const ppAstBoolean = ({ value }: A.AstBoolean) => value.toString();
export const ppAstString = ({ value }: A.AstString) => `"${value}"`;
export const ppAstNull = (_expr: A.AstNull) => "null";
export const ppAstId = ({ text }: A.AstId) => text;

export const ppLeaf =
    <T>(printer: (t: T) => string) =>
    (node: T) =>
    (): string =>
        printer(node);

export const ppAstExpressionVisitor = makeVisitor<A.AstExpression>()({
    op_binary: ppAstOpBinary,
    op_unary: ppAstOpUnary,
    field_access: ppAstFieldAccess,
    method_call: ppAstMethodCall,
    static_call: ppAstStaticCall,
    init_of: ppAstInitOf,
    conditional: ppAstConditional,
    struct_instance: ppLeaf(ppAstStructInstance),
    number: ppLeaf(ppAstNumber),
    boolean: ppLeaf(ppAstBoolean),
    string: ppLeaf(ppAstString),
    null: ppLeaf(ppAstNull),
    id: ppLeaf(ppAstId),
});

export const ppAstExpression = (
    expr: A.AstExpression,
    parentPrecedence: number = 0,
): string => {
    const currPrecedence = getPrecedence(expr);

    const result = ppAstExpressionVisitor(expr)(currPrecedence);

    const needParens = parentPrecedence > 0 && currPrecedence > 0 && currPrecedence < parentPrecedence;

    return needParens ? `(${result})` : result;
};

type Context<U> = {
    /**
     * Line of code with \n implied
     */
    row: (s: string) => U;

    /**
     * Stacks lines after each other
     */
    block: (rows: readonly U[]) => U;

    /**
     * Similar to `block`, but adjacent lines of groups get concatenated
     * [a, b] + [c, d] = [a, bc, d]
     */
    concat: (rows: readonly U[]) => U;

    /**
     * Same as `indent`, but indents `rows` 1 level deeper and adds `{` and `}`
     */
    braced: (rows: readonly U[]) => U;

    /**
     * Print a list of `items` with `print`
     */
    list: <T>(items: readonly T[], print: Printer<T>) => readonly U[];

    /**
     * Display `items` with `print` in groups distinguished by return value of `getTag`
     */
    grouped: <T, V>(options: {
        items: readonly T[];
        getTag: (t: T) => V;
        print: Printer<T>;
    }) => readonly U[];
};

type LevelFn = (level: number) => string;
type ContextModel = readonly LevelFn[];

const emptyLine = Object.freeze(new Array<LevelFn>());
const createContext = (spaces: number): Context<ContextModel> => {
    const row = (s: string) => [
        (level: number) => " ".repeat(level * spaces) + s,
    ];
    const concat = (rows: readonly ContextModel[]): ContextModel => {
        const [head, ...tail] = rows;
        if (isUndefined(head)) {
            return [];
        }
        const next = concat(tail);
        const init = [...head];
        const last = init.pop();
        if (isUndefined(last)) {
            return next;
        }
        const [nextHead, ...nextTail] = next;
        if (isUndefined(nextHead)) {
            return head;
        }
        return [...init, (level) => last(level) + nextHead(level), ...nextTail];
    };
    const block = (rows: readonly ContextModel[]) => rows.flat();
    const indent = (rows: readonly ContextModel[]) =>
        block(rows).map((f) => (level: number) => f(level + 1));
    const braced = (rows: readonly ContextModel[]) =>
        block([row(`{`), indent(rows), row(`}`)]);
    const list = <T>(items: readonly T[], print: Printer<T>) =>
        items.map((node) => print(node)(ctx));
    const grouped = <T, V>({
        items,
        getTag,
        print,
    }: {
        items: readonly T[];
        getTag: (t: T) => V;
        print: Printer<T>;
    }) => {
        return intercalate(
            groupBy(items, getTag).map((group) => list(group, print)),
            emptyLine,
        );
    };
    const ctx: Context<ContextModel> = {
        row,
        concat,
        block,
        braced,
        list,
        grouped,
    };
    return ctx;
};

type Printer<T> = (item: T) => <U>(ctx: Context<U>) => U;

type Functional = A.AstFunctionDef | A.AstAsmFunctionDef | A.AstFunctionDecl;

export const ppAstModule: Printer<A.AstModule> =
    ({ imports, items }) =>
    (c) => {
        const itemsCode = c.grouped({
            items,
            getTag: ({ kind }) => (kind === "constant_def" ? 1 : NaN),
            print: ppModuleItem,
        });
        if (imports.length === 0) {
            return c.block(itemsCode);
        }
        return c.block([
            ...c.list(imports, ppAstImport),
            c.row(""),
            ...itemsCode,
        ]);
    };

export const ppAstStruct: Printer<A.AstStructDecl> =
    ({ name, fields }) =>
    (c) => {
        // BUG with }
        return c.concat([
            c.row(`struct ${ppAstId(name)} `),
            c.braced(c.list(fields, ppAstFieldDecl)),
        ]);
    };

export const ppAstContract: Printer<A.AstContract> =
    ({ name, traits, declarations, attributes }) =>
    (c) => {
        const attrsCode = attributes
            .map(({ name: { value } }) => `@interface("${value}") `)
            .join("");
        const traitsCode = traits.map((trait) => trait.text).join(", ");
        const header = traitsCode
            ? `contract ${ppAstId(name)} with ${traitsCode}`
            : `contract ${ppAstId(name)}`;
        return c.concat([
            c.row(`${attrsCode}${header} `),
            c.braced(
                c.grouped({
                    items: declarations,
                    getTag: ({ kind }) =>
                        kind === "constant_def"
                            ? 1
                            : kind === "field_decl"
                              ? 2
                              : NaN,
                    print: ppContractBody,
                }),
            ),
        ]);
    };

export const ppAstPrimitiveTypeDecl: Printer<A.AstPrimitiveTypeDecl> =
    ({ name }) =>
    (c) => {
        return c.row(`primitive ${ppAstId(name)};`);
    };

export const ppAstFunctionDef: Printer<A.AstFunctionDef> = (node) => (c) => {
    return c.concat([
        c.row(ppAstFunctionSignature(node)),
        ppStatementBlock(node.statements)(c),
    ]);
};

export const ppAsmShuffle = ({ args, ret }: A.AstAsmShuffle): string => {
    if (args.length === 0 && ret.length === 0) {
        return "";
    }
    const argsCode = args.map(({ text }) => text).join(" ");
    if (ret.length === 0) {
        return `(${argsCode})`;
    }
    const retCode = ret.map(({ value }) => value.toString()).join(" ");
    return `(${argsCode} -> ${retCode})`;
};

export const ppAstAsmFunctionDef: Printer<A.AstAsmFunctionDef> =
    (node) => (c) => {
        return c.concat([
            c.row(
                `asm${ppAsmShuffle(node.shuffle)} ${ppAstFunctionSignature(node)} `,
            ),
            ppAsmInstructionsBlock(node.instructions)(c),
        ]);
    };

export const ppAstNativeFunction: Printer<A.AstNativeFunctionDecl> =
    ({ name, nativeName, params, return: retTy, attributes }) =>
    (c) => {
        const attrs = attributes.map(({ type }) => type + " ").join("");
        const argsCode = params
            .map(({ name, type }) => `${ppAstId(name)}: ${ppAstType(type)}`)
            .join(", ");
        const returnType = retTy ? `: ${ppAstType(retTy)}` : "";
        return c.block([
            c.row(`@name(${ppAstFuncId(nativeName)})`),
            c.row(`${attrs}native ${ppAstId(name)}(${argsCode})${returnType};`),
        ]);
    };

export const ppAstTrait: Printer<A.AstTrait> =
    ({ name, traits, attributes, declarations }) =>
    (c) => {
        const attrsCode = attributes
            .map((attr) => `@${attr.type}("${attr.name.value}") `)
            .join("");
        const traitsCode = traits.map((t) => ppAstId(t)).join(", ");
        const header = traitsCode
            ? `trait ${ppAstId(name)} with ${traitsCode}`
            : `trait ${ppAstId(name)}`;
        return c.concat([
            c.row(`${attrsCode}${header} `),
            c.braced(
                c.grouped({
                    items: declarations,
                    getTag: ({ kind }) =>
                        kind === "constant_def" || kind === "constant_decl"
                            ? 1
                            : kind === "field_decl"
                              ? 2
                              : NaN,
                    print: ppTraitBody,
                }),
            ),
        ]);
    };

export const ppAstConstant: Printer<A.AstConstantDef> =
    ({ attributes, initializer, name, type }) =>
    (c) => {
        const attrsCode = attributes.map(({ type }) => type + " ").join("");
        return c.row(
            `${attrsCode}const ${ppAstId(name)}: ${ppAstType(type)} = ${ppAstExpression(initializer)};`,
        );
    };

export const ppAstMessage: Printer<A.AstMessageDecl> =
    ({ name, opcode, fields }) =>
    (c) => {
        const prefixCode =
            opcode !== null ? `(${A.astNumToString(opcode)})` : "";
        // BUG with }
        return c.concat([
            c.row(`message${prefixCode} ${ppAstId(name)} `),
            c.braced(c.list(fields, ppAstFieldDecl)),
        ]);
    };

export const ppModuleItem: Printer<A.AstModuleItem> =
    makeVisitor<A.AstModuleItem>()({
        struct_decl: ppAstStruct,
        contract: ppAstContract,
        primitive_type_decl: ppAstPrimitiveTypeDecl,
        function_def: ppAstFunctionDef,
        asm_function_def: ppAstAsmFunctionDef,
        native_function_decl: ppAstNativeFunction,
        trait: ppAstTrait,
        constant_def: ppAstConstant,
        message_decl: ppAstMessage,
    });

export const ppAstFieldDecl: Printer<A.AstFieldDecl> =
    ({ type, initializer, as, name }) =>
    (c) => {
        const asAlias = as ? ` as ${ppAstId(as)}` : "";
        const initializerCode = initializer
            ? ` = ${ppAstExpression(initializer)}`
            : "";
        return c.row(
            `${ppAstId(name)}: ${ppAstType(type)}${asAlias}${initializerCode};`,
        );
    };

export const ppAstReceiver: Printer<A.AstReceiver> =
    ({ selector, statements }) =>
    (c) => {
        return c.concat([
            c.row(`${ppAstReceiverHeader(selector)} `),
            ppStatementBlock(statements)(c),
        ]);
    };

export const ppAstFunctionDecl: Printer<A.AstFunctionDecl> = (f) => (c) => {
    return c.row(`${ppAstFunctionSignature(f)};`);
};

export const ppAstConstDecl: Printer<A.AstConstantDecl> =
    ({ attributes, name, type }) =>
    (c) => {
        const attrsCode = attributes.map(({ type }) => type + " ").join("");
        return c.row(`${attrsCode}const ${ppAstId(name)}: ${ppAstType(type)};`);
    };

export const ppTraitBody: Printer<A.AstTraitDeclaration> =
    makeVisitor<A.AstTraitDeclaration>()({
        function_def: ppAstFunctionDef,
        asm_function_def: ppAstAsmFunctionDef,
        constant_def: ppAstConstant,
        field_decl: ppAstFieldDecl,
        receiver: ppAstReceiver,
        function_decl: ppAstFunctionDecl,
        constant_decl: ppAstConstDecl,
    });

export const ppAstInitFunction: Printer<A.AstContractInit> =
    ({ params, statements }) =>
    (c) => {
        const argsCode = params
            .map(({ name, type }) => `${ppAstId(name)}: ${ppAstType(type)}`)
            .join(", ");
        if (statements.length === 0) {
            return c.row(`init(${argsCode}) {}`);
        }
        return c.concat([
            c.row(`init(${argsCode}) `),
            c.braced(c.list(statements, ppAstStatement)),
        ]);
    };

export const ppContractBody: Printer<A.AstContractDeclaration> =
    makeVisitor<A.AstContractDeclaration>()({
        field_decl: ppAstFieldDecl,
        function_def: ppAstFunctionDef,
        asm_function_def: ppAstAsmFunctionDef,
        contract_init: ppAstInitFunction,
        receiver: ppAstReceiver,
        constant_def: ppAstConstant,
    });

export const ppAstImport: Printer<A.AstImport> =
    ({ path }) =>
    (c) => {
        return c.row(`import "${path.value}";`);
    };

export const ppAstFunctionSignature = ({
    name,
    attributes,
    return: retTy,
    params,
}: Functional): string => {
    const argsCode = params
        .map(({ name, type }) => `${ppAstId(name)}: ${ppAstType(type)}`)
        .join(", ");
    const attrsCode = attributes
        .map((attr) => ppAstFunctionAttribute(attr) + " ")
        .join("");
    const returnType = retTy ? `: ${ppAstType(retTy)}` : "";
    return `${attrsCode}fun ${ppAstId(name)}(${argsCode})${returnType}`;
};

export const ppAstFunctionAttribute = (
    attr: A.AstFunctionAttribute,
): string => {
    if (attr.type === "get" && attr.methodId !== null) {
        return `get(${ppAstExpression(attr.methodId)})`;
    } else {
        return attr.type;
    }
};

export const ppAstReceiverHeader = makeVisitor<A.AstReceiverKind>()({
    bounce: ({ param: { name, type } }) =>
        `bounced(${ppAstId(name)}: ${ppAstType(type)})`,
    "internal-simple": ({ param: { name, type } }) =>
        `receive(${ppAstId(name)}: ${ppAstType(type)})`,
    "external-simple": ({ param: { name, type } }) =>
        `external(${ppAstId(name)}: ${ppAstType(type)})`,
    "internal-fallback": () => `receive()`,
    "external-fallback": () => `external()`,
    "internal-comment": ({ comment: { value } }) => `receive("${value}")`,
    "external-comment": ({ comment: { value } }) => `external("${value}")`,
});

export const ppAstFuncId = (func: A.AstFuncId): string => func.text;

//
// Statements
//

export const ppStatementBlock: Printer<A.AstStatement[]> = (stmts) => (c) => {
    return c.braced(c.list(stmts, ppAstStatement));
};

export const ppAsmInstructionsBlock: Printer<A.AstAsmInstruction[]> =
    (instructions) => (c) => {
        return c.braced(instructions.map(c.row));
    };

export const ppAstStatementLet: Printer<A.AstStatementLet> =
    ({ type, name, expression }) =>
    (c) => {
        const tyAnnotation = type === null ? "" : `: ${ppAstType(type)}`;
        return c.row(
            `let ${ppAstId(name)}${tyAnnotation} = ${ppAstExpression(expression)};`,
        );
    };

export const ppAstStatementReturn: Printer<A.AstStatementReturn> =
    ({ expression }) =>
    (c) => {
        return c.row(
            `return ${expression ? ppAstExpression(expression) : ""};`,
        );
    };

export const ppAstStatementExpression: Printer<A.AstStatementExpression> =
    ({ expression }) =>
    (c) => {
        return c.row(`${ppAstExpression(expression)};`);
    };

export const ppAstStatementAssign: Printer<A.AstStatementAssign> =
    ({ path, expression }) =>
    (c) => {
        return c.row(
            `${ppAstExpression(path)} = ${ppAstExpression(expression)};`,
        );
    };

export const ppAstStatementAugmentedAssign: Printer<
    A.AstStatementAugmentedAssign
> =
    ({ path, op, expression }) =>
    (c) => {
        return c.row(
            `${ppAstExpression(path)} ${op}= ${ppAstExpression(expression)};`,
        );
    };

export const ppAstCondition: Printer<A.AstCondition> =
    ({ condition, trueStatements, falseStatements }) =>
    (c) => {
        if (falseStatements) {
            return c.concat([
                c.row(`if (${ppAstExpression(condition)}) `),
                ppStatementBlock(trueStatements)(c),
                c.row(" else "),
                ppStatementBlock(falseStatements)(c),
            ]);
        } else {
            return c.concat([
                c.row(`if (${ppAstExpression(condition)}) `),
                ppStatementBlock(trueStatements)(c),
            ]);
        }
    };

export const ppAstStatementWhile: Printer<A.AstStatementWhile> =
    ({ condition, statements }) =>
    (c) => {
        return c.concat([
            c.row(`while (${ppAstExpression(condition)}) `),
            ppStatementBlock(statements)(c),
        ]);
    };

export const ppAstStatementRepeat: Printer<A.AstStatementRepeat> =
    ({ iterations, statements }) =>
    (c) => {
        return c.concat([
            c.row(`repeat (${ppAstExpression(iterations)}) `),
            ppStatementBlock(statements)(c),
        ]);
    };

export const ppAstStatementUntil: Printer<A.AstStatementUntil> =
    ({ condition, statements }) =>
    (c) => {
        return c.concat([
            c.row(`do `),
            ppStatementBlock(statements)(c),
            c.row(` until (${ppAstExpression(condition)});`),
        ]);
    };

export const ppAstStatementForEach: Printer<A.AstStatementForEach> =
    ({ keyName, valueName, map, statements }) =>
    (c) => {
        return c.concat([
            c.row(
                `foreach (${ppAstId(keyName)}, ${ppAstId(valueName)} in ${ppAstExpression(map)}) `,
            ),
            ppStatementBlock(statements)(c),
        ]);
    };

export const ppAstStatementTry: Printer<A.AstStatementTry> =
    ({ statements }) =>
    (c) => {
        return c.concat([c.row(`try `), ppStatementBlock(statements)(c)]);
    };

export const ppAstStatementTryCatch: Printer<A.AstStatementTryCatch> =
    ({ statements, catchName, catchStatements }) =>
    (c) => {
        return c.concat([
            c.row(`try `),
            ppStatementBlock(statements)(c),
            c.row(` catch (${ppAstId(catchName)}) `),
            ppStatementBlock(catchStatements)(c),
        ]);
    };

export const ppAstStatementDestruct: Printer<A.AstStatementDestruct> =
    ({ type, identifiers, ignoreUnspecifiedFields, expression }) =>
    (c) => {
        const ids: string[] = [];
        for (const [field, name] of identifiers.values()) {
            const id =
                field.text === name.text
                    ? ppAstId(name)
                    : `${ppAstId(field)}: ${ppAstId(name)}`;
            ids.push(id);
        }
        const restPattern = ignoreUnspecifiedFields ? ", .." : "";
        return c.row(
            `let ${ppAstTypeId(type)} {${ids.join(", ")}${restPattern}} = ${ppAstExpression(expression)};`,
        );
    };

export const ppAstStatement: Printer<A.AstStatement> =
    makeVisitor<A.AstStatement>()({
        statement_let: ppAstStatementLet,
        statement_return: ppAstStatementReturn,
        statement_expression: ppAstStatementExpression,
        statement_assign: ppAstStatementAssign,
        statement_augmentedassign: ppAstStatementAugmentedAssign,
        statement_condition: ppAstCondition,
        statement_while: ppAstStatementWhile,
        statement_until: ppAstStatementUntil,
        statement_repeat: ppAstStatementRepeat,
        statement_foreach: ppAstStatementForEach,
        statement_try: ppAstStatementTry,
        statement_try_catch: ppAstStatementTryCatch,
        statement_destruct: ppAstStatementDestruct,
    });

export const exprNode =
    <T>(exprPrinter: (expr: T) => string): Printer<T> =>
    (node) =>
    (c) => {
        return c.row(exprPrinter(node));
    };

export const ppAstNode: Printer<A.AstNode> = makeVisitor<A.AstNode>()({
    op_binary: exprNode(ppAstExpression),
    op_unary: exprNode(ppAstExpression),
    field_access: exprNode(ppAstExpression),
    method_call: exprNode(ppAstExpression),
    static_call: exprNode(ppAstExpression),
    struct_instance: exprNode(ppAstExpression),
    init_of: exprNode(ppAstExpression),
    conditional: exprNode(ppAstExpression),
    number: exprNode(ppAstExpression),
    id: exprNode(ppAstExpression),
    boolean: exprNode(ppAstExpression),
    string: exprNode(ppAstExpression),
    null: exprNode(ppAstExpression),
    type_id: exprNode(ppAstType),
    optional_type: exprNode(ppAstType),
    map_type: exprNode(ppAstType),
    bounced_message_type: exprNode(ppAstType),
    struct_field_initializer: exprNode(ppAstStructFieldInit),
    destruct_mapping: () => {
        throw new Error("BUG");
    },
    typed_parameter: () => {
        throw new Error("BUG");
    },

    module: ppAstModule,
    struct_decl: ppAstStruct,
    constant_def: ppAstConstant,
    constant_decl: ppAstConstDecl,
    function_def: ppAstFunctionDef,
    contract: ppAstContract,
    trait: ppAstTrait,
    primitive_type_decl: ppAstPrimitiveTypeDecl,
    message_decl: ppAstMessage,
    native_function_decl: ppAstNativeFunction,
    field_decl: ppAstFieldDecl,
    function_decl: ppAstFunctionDecl,
    receiver: ppAstReceiver,
    contract_init: ppAstInitFunction,
    statement_let: ppAstStatementLet,
    statement_return: ppAstStatementReturn,
    statement_expression: ppAstStatementExpression,
    statement_assign: ppAstStatementAssign,
    statement_augmentedassign: ppAstStatementAugmentedAssign,
    statement_condition: ppAstCondition,
    statement_while: ppAstStatementWhile,
    statement_until: ppAstStatementUntil,
    statement_repeat: ppAstStatementRepeat,
    statement_try: ppAstStatementTry,
    statement_try_catch: ppAstStatementTryCatch,
    statement_foreach: ppAstStatementForEach,
    import: ppAstImport,
    func_id: exprNode(ppAstFuncId),
    statement_destruct: ppAstStatementDestruct,
    function_attribute: exprNode(ppAstFunctionAttribute),
    asm_function_def: ppAstAsmFunctionDef,
});

/**
 * Pretty-prints an AST node into a string representation.
 * @param node The AST node to format.
 * @returns A string that represents the formatted AST node.
 */
export const prettyPrint = (node: A.AstNode): string => {
    // Default number of spaces per indentation level is 4
    return (
        ppAstNode(node)(createContext(4))
            // Initial level of indentation is 0
            .map((f) => f(0))
            // Lines are terminated with \n
            .join("\n")
    );
};
