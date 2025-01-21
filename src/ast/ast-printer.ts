import * as A from "./ast";
import { groupBy, intercalate, isUndefined } from "../utils/array";
import { makeVisitor } from "../utils/tricks";

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
}: A.AstBouncedMessageType): string => `bounced<${ppAstTypeId(messageType)}>`;

export const ppAstOptionalType = ({ typeArg }: A.AstOptionalType): string =>
    `${ppAstType(typeArg)}?`;

export const ppAstType = makeVisitor<A.AstType>()({
    type_id: ppAstTypeId,
    map_type: ppAstMapType,
    bounced_message_type: ppAstBouncedMessageType,
    optional_type: ppAstOptionalType,
});

//
// Expressions
//

export const unaryOperatorType: Record<A.AstUnaryOperation, "post" | "pre"> = {
    "+": "pre",
    "-": "pre",
    "!": "pre",
    "~": "pre",

    "!!": "post",
};

export const checkPostfix = (operator: A.AstUnaryOperation) =>
    unaryOperatorType[operator] === "post";

/**
 * Description of precedence of certain type of AST node
 */
export type Precedence = {
    /**
     * Add parentheses around `code` if in this `parent` position we need brackets
     * @param check Position-checking function from parent
     * @param code Code to put parentheses around
     * @returns
     */
    brace: (
        position: (childPrecedence: number) => boolean,
        code: string,
    ) => string;
    /**
     * Used in positions where grammar rule mentions itself
     *
     * Passed down when a position allows same unparenthesized operator
     * For example, on left side of addition we can use another addition without
     * parentheses: `1 + 2 + 3` means `(1 + 2) + 3`. Thus for left-associative
     * operators we pass `self` to their left argument printer.
     */
    self: (childPrecedence: number) => boolean;
    /**
     * Used in positions where grammar rule mentions other rule
     *
     * Passed down when a position disallows same unparenthesized operator
     * For example, on the right side of subtraction we can't use another subtraction
     * without parentheses: `1 - (2 - 3)` is not the same as `(1 - 2) - 3`. Thus for
     * left-associative operators we pass `child` to their right argument printer.
     */
    child: (childPrecedence: number) => boolean;
};

/**
 * Given numeric value of precedence, where higher values stand for higher binding power,
 * create a helper object for precedence checking
 */
export const makePrecedence = (myPrecedence: number): Precedence => ({
    brace: (position, code) => (position(myPrecedence) ? `(${code})` : code),
    self: (childPrecedence) => childPrecedence < myPrecedence,
    child: (childPrecedence) => childPrecedence <= myPrecedence,
});

// Least binding operator
export const lowestPrecedence = makePrecedence(0);

export const conditionalPrecedence = makePrecedence(20);

export const binaryPrecedence: Readonly<
    Record<A.AstBinaryOperation, Precedence>
> = {
    "||": makePrecedence(30),

    "&&": makePrecedence(40),

    "|": makePrecedence(50),

    "^": makePrecedence(60),

    "&": makePrecedence(70),

    "==": makePrecedence(80),
    "!=": makePrecedence(80),

    "<": makePrecedence(90),
    ">": makePrecedence(90),
    "<=": makePrecedence(90),
    ">=": makePrecedence(90),

    "<<": makePrecedence(100),
    ">>": makePrecedence(100),

    "+": makePrecedence(110),
    "-": makePrecedence(110),

    "*": makePrecedence(120),
    "/": makePrecedence(120),
    "%": makePrecedence(120),
};

export const prefixPrecedence = makePrecedence(140);

// Used by postfix unary !!, method calls and field accesses
export const postfixPrecedence = makePrecedence(150);

/**
 * Expression printer takes an expression and a function from parent AST node printer that checks
 * whether expressions with given precedence should be parenthesized in parent context
 */
export type ExprPrinter<T> = (
    expr: T,
) => (check: (childPrecedence: number) => boolean) => string;

/**
 * Wrapper for AST nodes that should never be parenthesized, and thus do not require information
 * about the position they're printed in
 *
 * Takes a regular printer function and returns corresponding ExprPrinter that ignores all
 * position and precedence information
 */
export const ppLeaf =
    <T>(printer: (t: T) => string): ExprPrinter<T> =>
    (node) =>
    () =>
        printer(node);

export const ppExprArgs = (args: A.AstExpression[]) =>
    args.map((arg) => ppAstExpression(arg)).join(", ");

export const ppAstStructFieldInit = (
    param: A.AstStructFieldInitializer,
): string => `${ppAstId(param.field)}: ${ppAstExpression(param.initializer)}`;
export const ppAstStructFieldValue = (param: A.AstStructFieldValue): string =>
    `${ppAstId(param.field)}: ${ppAstExpression(param.initializer)}`;

export const ppAstStructInstance = ({ type, args }: A.AstStructInstance) =>
    `${ppAstId(type)}{${args.map((x) => ppAstStructFieldInit(x)).join(", ")}}`;
export const ppAstStructValue = ({ type, args }: A.AstStructValue) =>
    `${ppAstId(type)}{${args.map((x) => ppAstStructFieldValue(x)).join(", ")}}`;

export const ppAstInitOf = ({ contract, args }: A.AstInitOf) =>
    `initOf ${ppAstId(contract)}(${ppExprArgs(args)})`;

export const ppAstNumber = A.astNumToString;
export const ppAstBoolean = ({ value }: A.AstBoolean) => value.toString();
export const ppAstId = ({ text }: A.AstId) => text;
export const ppAstNull = (_expr: A.AstNull) => "null";
export const ppAstString = ({ value }: A.AstString) => `"${value}"`;
export const ppAstCommentValue = ({ value }: A.AstCommentValue) =>
    JSON.stringify(value);
export const ppAstSimplifiedString = ({ value }: A.AstSimplifiedString) =>
    JSON.stringify(value);
export const ppAstAddress = ({ value }: A.AstAddress) =>
    `addr("${value.toRawString()}")`;
export const ppAstCell = ({ value }: A.AstCell) =>
    `cell("${value.toString()}")`;
export const ppAstSlice = ({ value }: A.AstSlice) =>
    `slice("${value.toString()}")`;

export const ppAstStaticCall = ({ function: func, args }: A.AstStaticCall) => {
    return `${ppAstId(func)}(${ppExprArgs(args)})`;
};

export const ppAstMethodCall: ExprPrinter<A.AstMethodCall> =
    ({ self: object, method, args }) =>
    (position) => {
        const { brace, self } = postfixPrecedence;
        return brace(
            position,
            `${ppAstExpressionNested(object)(self)}.${ppAstId(method)}(${ppExprArgs(args)})`,
        );
    };

export const ppAstFieldAccess: ExprPrinter<A.AstFieldAccess> =
    ({ aggregate, field }) =>
    (position) => {
        const { brace, self } = postfixPrecedence;
        return brace(
            position,
            `${ppAstExpressionNested(aggregate)(self)}.${ppAstId(field)}`,
        );
    };

export const ppAstOpUnary: ExprPrinter<A.AstOpUnary> =
    ({ op, operand }) =>
    (position) => {
        const isPostfix = checkPostfix(op);
        const { brace, self } = isPostfix
            ? postfixPrecedence
            : prefixPrecedence;
        const code = ppAstExpressionNested(operand)(self);
        return brace(position, isPostfix ? `${code}${op}` : `${op}${code}`);
    };

export const ppAstOpBinary: ExprPrinter<A.AstOpBinary> =
    ({ left, op, right }) =>
    (position) => {
        const { brace, self, child } = binaryPrecedence[op];
        const leftCode = ppAstExpressionNested(left)(self);
        const rightCode = ppAstExpressionNested(right)(child);
        return brace(position, `${leftCode} ${op} ${rightCode}`);
    };

export const ppAstConditional: ExprPrinter<A.AstConditional> =
    ({ condition, thenBranch, elseBranch }) =>
    (position) => {
        const { brace, self, child } = conditionalPrecedence;
        const conditionCode = ppAstExpressionNested(condition)(child);
        const thenCode = ppAstExpressionNested(thenBranch)(child);
        const elseCode = ppAstExpressionNested(elseBranch)(self);
        return brace(position, `${conditionCode} ? ${thenCode} : ${elseCode}`);
    };

export const ppAstExpressionNested = makeVisitor<A.AstExpression>()({
    struct_instance: ppLeaf(ppAstStructInstance),
    struct_value: ppLeaf(ppAstStructValue),
    number: ppLeaf(ppAstNumber),
    boolean: ppLeaf(ppAstBoolean),
    id: ppLeaf(ppAstId),
    null: ppLeaf(ppAstNull),
    init_of: ppLeaf(ppAstInitOf),
    string: ppLeaf(ppAstString),
    static_call: ppLeaf(ppAstStaticCall),
    comment_value: ppLeaf(ppAstCommentValue),
    simplified_string: ppLeaf(ppAstSimplifiedString),
    address: ppLeaf(ppAstAddress),
    cell: ppLeaf(ppAstCell),
    slice: ppLeaf(ppAstSlice),

    method_call: ppAstMethodCall,
    field_access: ppAstFieldAccess,

    op_unary: ppAstOpUnary,

    op_binary: ppAstOpBinary,

    conditional: ppAstConditional,
});

export const ppAstExpression = (expr: A.AstExpression): string => {
    return ppAstExpressionNested(expr)(lowestPrecedence.child);
};

/**
 * An intermediate language that is only concerned of spacing and indentation
 */
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
        /**
         * Items with the same tag are displayed without extra empty line between them
         *
         * Use NaN for tag whenever items should always be displayed with empty line,
         * because NaN !== NaN
         */
        getTag: (t: T) => V;
        print: Printer<T>;
    }) => readonly U[];
};

/**
 * Generates line of code with indentation, given desired indentation level of outer scope
 */
type LevelFn = (level: number) => string;

/**
 * Result of printing an expression is an array of rows, parameterized over indentation
 * of outer scope
 */
type ContextModel = readonly LevelFn[];

/**
 * Concatenates an array of printing results, so that last line of each expression is merged
 * with first line of next expression
 *
 * Typically used to generate multiline indented code as part of single-line expression
 *
 * Roughly, `concat(["while (true)"], [" "], ["{", "...", "}"]) = ["while (true) {", "...", "}"]`
 */
const concat = ([head, ...tail]: readonly ContextModel[]): ContextModel => {
    // If we're concatenating an empty array, the result is always empty
    if (isUndefined(head)) {
        return [];
    }
    // Create a copy of first printing result, where we'll accumulate other results
    const init = [...head];
    // Recursively concatenate all printing results except for first
    const next = concat(tail);
    // Take last line of first printing result
    const last = init.pop();
    // If first printing result has no lines, return concatenation result of all others
    if (isUndefined(last)) {
        return next;
    }
    // Get first line on concatenated printing results starting with second
    const [nextHead, ...nextTail] = next;
    // If they all concatenated into an array of 0 lines, just return first printing result
    if (isUndefined(nextHead)) {
        return head;
    }
    // Otherwise concatenate results, leaving indent only in front of the merged line
    return [...init, (level) => last(level) + nextHead(0), ...nextTail];
};

const createContext = (spaces: number): Context<ContextModel> => {
    const row = (s: string) => [
        // Empty lines are not indented
        (level: number) => (s === "" ? s : " ".repeat(level * spaces) + s),
    ];
    const block = (rows: readonly ContextModel[]) => rows.flat();
    const indent = (rows: readonly ContextModel[]) =>
        block(rows).map((f) => (level: number) => f(level + 1));
    const braced = (rows: readonly ContextModel[]) =>
        block(
            rows.length > 0 ? [row(`{`), indent(rows), row(`}`)] : [row("{ }")],
        );
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
            row(""),
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

/**
 * Prints AST node of type `T` into an intermediate language of row of type `U`
 *
 * We enforce `U` to be a generic argument so that no implementation can (ab)use
 * the fact it's a string and generate some indentation without resorting to
 * methods of `Context`.
 */
type Printer<T> = (item: T) => <U>(ctx: Context<U>) => U;

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
    (c) =>
        c.concat([
            c.row(`struct ${ppAstId(name)} `),
            c.braced(c.list(fields, ppAstFieldDecl)),
        ]);

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
    (c) =>
        c.row(`primitive ${ppAstId(name)};`);

export const ppAstFunctionDef: Printer<A.AstFunctionDef> = (node) => (c) =>
    c.concat([
        c.row(ppAstFunctionSignature(node)),
        c.row(" "),
        ppStatementBlock(node.statements)(c),
    ]);

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
    (node) => (c) =>
        c.concat([
            c.row(
                `asm${ppAsmShuffle(node.shuffle)} ${ppAstFunctionSignature(node)} `,
            ),
            ppAsmInstructionsBlock(node.instructions)(c),
        ]);

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
            opcode !== null ? `(${ppAstExpression(opcode)})` : "";

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
    (c) =>
        c.concat([
            c.row(`${ppAstReceiverHeader(selector)} `),
            ppStatementBlock(statements)(c),
        ]);

export const ppAstFunctionDecl: Printer<A.AstFunctionDecl> = (f) => (c) =>
    c.row(`${ppAstFunctionSignature(f)};`);

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
    (c) =>
        c.row(`import "${path.value}";`);

export const ppAstFunctionSignature = ({
    name,
    attributes,
    return: retTy,
    params,
}: A.AstFunctionDef | A.AstAsmFunctionDef | A.AstFunctionDecl): string => {
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

export const ppStatementBlock: Printer<A.AstStatement[]> = (stmts) => (c) =>
    c.braced(stmts.length === 0 ? [] : c.list(stmts, ppAstStatement));

export const ppAsmInstructionsBlock: Printer<A.AstAsmInstruction[]> =
    (instructions) => (c) =>
        c.braced(instructions.map(c.row));

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
    (c) =>
        c.row(`return ${expression ? ppAstExpression(expression) : ""};`);

export const ppAstStatementExpression: Printer<A.AstStatementExpression> =
    ({ expression }) =>
    (c) =>
        c.row(`${ppAstExpression(expression)};`);

export const ppAstStatementAssign: Printer<A.AstStatementAssign> =
    ({ path, expression }) =>
    (c) =>
        c.row(`${ppAstExpression(path)} = ${ppAstExpression(expression)};`);

export const ppAstStatementAugmentedAssign: Printer<
    A.AstStatementAugmentedAssign
> =
    ({ path, op, expression }) =>
    (c) =>
        c.row(
            `${ppAstExpression(path)} ${op}= ${ppAstExpression(expression)};`,
        );

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
    (c) =>
        c.concat([
            c.row(`while (${ppAstExpression(condition)}) `),
            ppStatementBlock(statements)(c),
        ]);

export const ppAstStatementRepeat: Printer<A.AstStatementRepeat> =
    ({ iterations, statements }) =>
    (c) =>
        c.concat([
            c.row(`repeat (${ppAstExpression(iterations)}) `),
            ppStatementBlock(statements)(c),
        ]);

export const ppAstStatementUntil: Printer<A.AstStatementUntil> =
    ({ condition, statements }) =>
    (c) =>
        c.concat([
            c.row(`do `),
            ppStatementBlock(statements)(c),
            c.row(` until (${ppAstExpression(condition)});`),
        ]);

export const ppAstStatementForEach: Printer<A.AstStatementForEach> =
    ({ keyName, valueName, map, statements }) =>
    (c) =>
        c.concat([
            c.row(
                `foreach (${ppAstId(keyName)}, ${ppAstId(valueName)} in ${ppAstExpression(map)}) `,
            ),
            ppStatementBlock(statements)(c),
        ]);

export const ppAstStatementTry: Printer<A.AstStatementTry> =
    ({ statements, catchBlock }) =>
    (c) => {
        const catchBlocks =
            catchBlock !== undefined
                ? [
                      c.row(` catch (${ppAstId(catchBlock.catchName)}) `),
                      ppStatementBlock(catchBlock.catchStatements)(c),
                  ]
                : [];

        return c.concat([
            c.row(`try `),
            ppStatementBlock(statements)(c),
            ...catchBlocks,
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

export const ppTypedParameter: Printer<A.AstTypedParameter> =
    ({ name, type }) =>
    (c) => {
        return c.row(`${ppAstId(name)}: ${ppAstType(type)}`);
    };

export const ppAstStatementBlock: Printer<A.AstStatementBlock> =
    ({ statements }) =>
    (c) =>
        ppStatementBlock(statements)(c);

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
        statement_destruct: ppAstStatementDestruct,
        statement_block: ppAstStatementBlock,
    });

export const exprNode =
    <T>(exprPrinter: (expr: T) => string): Printer<T> =>
    (node) =>
    (c) =>
        c.row(exprPrinter(node));

export const ppAstNode: Printer<A.AstNode> = makeVisitor<A.AstNode>()({
    op_binary: exprNode(ppAstExpression),
    op_unary: exprNode(ppAstExpression),
    field_access: exprNode(ppAstExpression),
    method_call: exprNode(ppAstExpression),
    static_call: exprNode(ppAstExpression),
    struct_instance: exprNode(ppAstExpression),
    struct_value: exprNode(ppAstStructValue),
    init_of: exprNode(ppAstExpression),
    conditional: exprNode(ppAstExpression),
    number: exprNode(ppAstExpression),
    id: exprNode(ppAstExpression),
    boolean: exprNode(ppAstExpression),
    string: exprNode(ppAstExpression),
    comment_value: exprNode(ppAstExpression),
    simplified_string: exprNode(ppAstExpression),
    null: exprNode(ppAstExpression),
    address: exprNode(ppAstExpression),
    cell: exprNode(ppAstExpression),
    slice: exprNode(ppAstExpression),
    type_id: exprNode(ppAstType),
    optional_type: exprNode(ppAstType),
    map_type: exprNode(ppAstType),
    bounced_message_type: exprNode(ppAstType),
    struct_field_initializer: exprNode(ppAstStructFieldInit),
    struct_field_value: exprNode(ppAstStructFieldValue),
    destruct_mapping: () => {
        throw new Error("Not implemented");
    },
    destruct_end: () => {
        throw new Error("Not implemented");
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
    statement_foreach: ppAstStatementForEach,
    statement_block: ppAstStatementBlock,
    import: ppAstImport,
    func_id: exprNode(ppAstFuncId),
    statement_destruct: ppAstStatementDestruct,
    function_attribute: exprNode(ppAstFunctionAttribute),
    asm_function_def: ppAstAsmFunctionDef,
    typed_parameter: ppTypedParameter,
});

/**
 * Pretty-prints an AST node into a string representation.
 * @param node The AST node to format.
 * @returns A string that represents the formatted AST node.
 */
export const prettyPrint = (node: A.AstNode): string =>
    ppAstNode(node)(createContext(4))
        // Initial level of indentation is 0
        .map((f) => f(0))
        // Lines are terminated with \n
        .join("\n");
