import {
    FuncAstNumberExpr,
    FuncAstHexNumberExpr,
    FuncAstBoolExpr,
    FuncAstStringExpr,
    FuncAstNilExpr,
    FuncAstIdExpr,
    FuncAstCallExpr,
    FuncAstAssignExpr,
    FuncAstAugmentedAssignExpr,
    FuncAstTernaryExpr,
    FuncAstBinaryExpr,
    FuncAstUnaryExpr,
    FuncAstApplyExpr,
    FuncAstTupleExpr,
    FuncAstTensorExpr,
    FuncAstUnitExpr,
    FuncAstHoleExpr,
    FuncAstPrimitiveTypeExpr,
    FuncStringLiteralType,
    FuncAstAugmentedAssignOp,
    FuncAstBinaryOp,
    FuncAstUnaryOp,
    FuncAstVarDefStmt,
    FuncAstReturnStmt,
    FuncAstBlockStmt,
    FuncAstRepeatStmt,
    FuncAstConditionStmt,
    FuncAstStmt,
    FuncAstDoUntilStmt,
    FuncAstWhileStmt,
    FuncAstExprStmt,
    FuncAstTryCatchStmt,
    FuncAstExpr,
    FuncType,
    FuncAstConstant,
    FuncAstFormalFunctionParam,
    FuncAstFunctionAttribute,
    FuncAstFunctionDeclaration,
    FuncAstFunctionDefinition,
    FuncAstComment,
    FuncAstInclude,
    FuncAstPragma,
    FuncAstGlobalVariable,
    FuncAstModuleEntry,
    FuncAstModule,
} from "./syntax";

function wrapToId<T extends FuncAstExpr | FuncAstIdExpr>(v: T | string): T {
    if (typeof v === "string" && v.includes("[object")) {
        throw new Error("Incorrect input");
    }
    return typeof v === "string" ? (id(v) as T) : v;
}

//
// Types
//
export class Type {
    public static int(): FuncType {
        return { kind: "int" };
    }

    public static cell(): FuncType {
        return { kind: "cell" };
    }

    public static slice(): FuncType {
        return { kind: "slice" };
    }

    public static builder(): FuncType {
        return { kind: "builder" };
    }

    public static cont(): FuncType {
        return { kind: "cont" };
    }

    public static tuple(): FuncType {
        return { kind: "tuple" };
    }

    public static tensor(...value: FuncType[]): FuncType {
        return { kind: "tensor", value };
    }

    public static hole(): FuncType {
        return { kind: "hole" };
    }

    public static type(): FuncType {
        return { kind: "type" };
    }
}

//
// Expressions
//

export const number = (num: bigint | number): FuncAstNumberExpr => ({
    kind: "number_expr",
    value: typeof num === "bigint" ? num : BigInt(num),
});

export const hexnumber = (value: string): FuncAstHexNumberExpr => ({
    kind: "hex_number_expr",
    value,
});

export const bool = (value: boolean): FuncAstBoolExpr => ({
    kind: "bool_expr",
    value,
});

export const string = (
    value: string,
    ty?: FuncStringLiteralType,
): FuncAstStringExpr => ({
    kind: "string_expr",
    value,
    ty,
});

export const nil = (): FuncAstNilExpr => ({
    kind: "nil_expr",
});

export const id = (value: string): FuncAstIdExpr => ({
    kind: "id_expr",
    value,
});

export function call(
    fun: FuncAstExpr | string,
    args: FuncAstExpr[],
    params: Partial<{ receiver: FuncAstExpr }> = {},
): FuncAstCallExpr {
    const { receiver = undefined } = params;
    return {
        kind: "call_expr",
        receiver,
        fun: wrapToId(fun),
        args,
    };
}

export const assign = (
    lhs: FuncAstExpr,
    rhs: FuncAstExpr,
): FuncAstAssignExpr => ({
    kind: "assign_expr",
    lhs,
    rhs,
});

export const augmentedAssign = (
    lhs: FuncAstExpr,
    op: FuncAstAugmentedAssignOp,
    rhs: FuncAstExpr,
): FuncAstAugmentedAssignExpr => ({
    kind: "augmented_assign_expr",
    lhs,
    op,
    rhs,
});

export const ternary = (
    cond: FuncAstExpr,
    trueExpr: FuncAstExpr,
    falseExpr: FuncAstExpr,
): FuncAstTernaryExpr => ({
    kind: "ternary_expr",
    cond,
    trueExpr,
    falseExpr,
});

export const binop = (
    lhs: FuncAstExpr,
    op: FuncAstBinaryOp,
    rhs: FuncAstExpr,
): FuncAstBinaryExpr => ({
    kind: "binary_expr",
    lhs,
    op,
    rhs,
});

export const unop = (
    op: FuncAstUnaryOp,
    value: FuncAstExpr,
): FuncAstUnaryExpr => ({
    kind: "unary_expr",
    op,
    value,
});

export const apply = (
    lhs: FuncAstExpr,
    rhs: FuncAstExpr,
): FuncAstApplyExpr => ({
    kind: "apply_expr",
    lhs,
    rhs,
});

export const tuple = (values: FuncAstExpr[]): FuncAstTupleExpr => ({
    kind: "tuple_expr",
    values,
});

export const tensor = (...values: FuncAstExpr[]): FuncAstTensorExpr => ({
    kind: "tensor_expr",
    values,
});

export const unit = (): FuncAstUnitExpr => ({
    kind: "unit_expr",
});

export const hole = (
    id: string | undefined,
    init: FuncAstExpr,
): FuncAstHoleExpr => ({
    kind: "hole_expr",
    id,
    init,
});

export const primitiveType = (ty: FuncType): FuncAstPrimitiveTypeExpr => ({
    kind: "primitive_type_expr",
    ty,
});

//
// Statements
//

export const vardef = (
    ty: FuncType | undefined,
    name: string | FuncAstIdExpr,
    init?: FuncAstExpr,
): FuncAstVarDefStmt => ({
    kind: "var_def_stmt",
    name: wrapToId(name),
    ty,
    init,
});

export const ret = (value?: FuncAstExpr): FuncAstReturnStmt => ({
    kind: "return_stmt",
    value,
});

export const block = (body: FuncAstStmt[]): FuncAstBlockStmt => ({
    kind: "block_stmt",
    body,
});

export const repeat = (
    condition: FuncAstExpr,
    body: FuncAstStmt[],
): FuncAstRepeatStmt => ({
    kind: "repeat_stmt",
    condition,
    body,
});

export const condition = (
    condition: FuncAstExpr | undefined,
    body: FuncAstStmt[],
    ifnot: boolean = false,
    elseStmt?: FuncAstConditionStmt,
): FuncAstConditionStmt => ({
    kind: "condition_stmt",
    condition,
    ifnot,
    body,
    else: elseStmt,
});

export const doUntil = (
    body: FuncAstStmt[],
    condition: FuncAstExpr,
): FuncAstDoUntilStmt => ({
    kind: "do_until_stmt",
    body,
    condition,
});

export const while_ = (
    condition: FuncAstExpr,
    body: FuncAstStmt[],
): FuncAstWhileStmt => ({
    kind: "while_stmt",
    condition,
    body,
});

export const expr = (expr: FuncAstExpr): FuncAstExprStmt => ({
    kind: "expr_stmt",
    expr,
});

export const tryCatch = (
    tryBlock: FuncAstStmt[],
    catchBlock: FuncAstStmt[],
    catchVar?: string | FuncAstIdExpr,
): FuncAstTryCatchStmt => ({
    kind: "try_catch_stmt",
    tryBlock,
    catchBlock,
    catchVar: catchVar === undefined ? undefined : wrapToId(catchVar),
});

// Other top-level elements

export function comment(
    ...args: (string | Partial<{ skipCR: boolean; style: ";" | ";;" }>)[]
): FuncAstComment {
    let params: Partial<{ skipCR: boolean; style: ";" | ";;" }> = {};
    let values: string[];

    if (args.length > 0 && typeof args[args.length - 1] === "object") {
        params = args.pop() as Partial<{ skipCR: boolean; style: ";" | ";;" }>;
    }
    values = args as string[];
    const { skipCR = false, style = ";;" } = params;
    return {
        kind: "comment",
        values,
        skipCR,
        style,
    };
}

export const constant = (ty: FuncType, init: FuncAstExpr): FuncAstConstant => ({
    kind: "constant",
    ty,
    init,
});

export const functionParam = (
    name: string | FuncAstIdExpr,
    ty: FuncType,
): FuncAstFormalFunctionParam => ({
    kind: "function_param",
    name: wrapToId(name),
    ty,
});

export const functionDeclaration = (
    name: string | FuncAstIdExpr,
    attrs: FuncAstFunctionAttribute[],
    params: FuncAstFormalFunctionParam[],
    returnTy: FuncType,
): FuncAstFunctionDeclaration => ({
    kind: "function_declaration",
    name: wrapToId(name),
    attrs,
    params,
    returnTy,
});

export const fun = (
    attrs: FuncAstFunctionAttribute[],
    name: string | FuncAstIdExpr,
    paramValues: [string, FuncType][],
    returnTy: FuncType,
    body: FuncAstStmt[],
): FuncAstFunctionDefinition => {
    const params = paramValues.map(
        ([name, ty]) =>
            ({
                kind: "function_param",
                name: wrapToId(name),
                ty,
            }) as FuncAstFormalFunctionParam,
    );
    return {
        kind: "function_definition",
        name: wrapToId(name),
        attrs,
        params,
        returnTy,
        body,
    };
};

export function toDeclaration(
    def: FuncAstFunctionDefinition,
): FuncAstFunctionDeclaration {
    return {
        kind: "function_declaration",
        attrs: def.attrs,
        name: def.name,
        params: def.params,
        returnTy: def.returnTy,
    };
}

export const include = (value: string): FuncAstInclude => ({
    kind: "include",
    value,
});

export const pragma = (value: string): FuncAstPragma => ({
    kind: "pragma",
    value,
});

export const globalVariable = (
    name: string | FuncAstIdExpr,
    ty: FuncType,
): FuncAstGlobalVariable => ({
    kind: "global_variable",
    name: wrapToId(name),
    ty,
});

export const moduleEntry = (entry: FuncAstModuleEntry): FuncAstModuleEntry =>
    entry;

export const mod = (...entries: FuncAstModuleEntry[]): FuncAstModule => ({
    kind: "module",
    entries,
});
