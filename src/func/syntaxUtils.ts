import {
    FuncAstExpr,
    FuncAstIdExpr,
    FuncAstFunctionAttribute,
    FuncAstFormalFunctionParam,
    FuncAstFunction,
    FuncType,
    FuncAstCallExpr,
    FuncAstBinaryOp,
    FuncAstStmt,
} from "./syntax";

export function makeId(value: string): FuncAstIdExpr {
    return { kind: "id_expr", value };
}

export function makeCall(
    fun: FuncAstExpr | string,
    args: FuncAstExpr[],
): FuncAstCallExpr {
    return {
        kind: "call_expr",
        fun: typeof fun === "string" ? makeId(fun) : fun,
        args,
    };
}

export function makeExprStmt(expr: FuncAstExpr): FuncAstStmt {
    return { kind: "expr_stmt", expr };
}

export function makeAssign(lhs: FuncAstExpr, rhs: FuncAstExpr): FuncAstExpr {
    return { kind: "assign_expr", lhs, rhs };
}

export function makeBinop(
    lhs: FuncAstExpr,
    op: FuncAstBinaryOp,
    rhs: FuncAstExpr,
): FuncAstExpr {
    return { kind: "binary_expr", lhs, op, rhs };
}

export function makeReturn(value: FuncAstExpr | undefined): FuncAstStmt {
    return { kind: "return_stmt", value };
}

export function makeFunction(
    attrs: FuncAstFunctionAttribute[],
    name: string,
    paramValues: [string, FuncType][],
    returnTy: FuncType,
    body: FuncAstStmt[],
): FuncAstFunction {
    const params = paramValues.map(([name, ty]) => {
        return {
            kind: "function_param",
            name,
            ty,
        } as FuncAstFormalFunctionParam;
    });
    return { kind: "function", attrs, name, params, returnTy, body };
}
