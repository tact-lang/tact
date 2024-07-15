import {
    FuncAstExpr,
    FuncAstIdExpr,
    FuncAstModuleEntry,
    FuncAstModule,
    FuncAstTernaryExpr,
    FuncAstPragma,
    FuncAstTensorExpr,
    FuncAstInclude,
    FuncAstFunctionAttribute,
    FuncAstFormalFunctionParam,
    FuncAstComment,
    FuncAstFunctionDefinition,
    FuncAstFunctionDeclaration,
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
): FuncAstFunctionDefinition {
    const params = paramValues.map(([name, ty]) => {
        return {
            kind: "function_param",
            name,
            ty,
        } as FuncAstFormalFunctionParam;
    });
    return { kind: "function_definition", attrs, name, params, returnTy, body };
}

export function declarationFromDefinition(
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

export function makeComment(...values: string[]): FuncAstComment {
    return { kind: "comment", values };
}

export function makePragma(value: string): FuncAstPragma {
    return { kind: "pragma", value };
}

export function makeInclude(value: string): FuncAstInclude {
    return { kind: "include", value };
}

export function makeTensorExpr(...values: FuncAstExpr[]): FuncAstTensorExpr {
    return { kind: "tensor_expr", values };
}

export function makeTernaryExpr(
    cond: FuncAstExpr,
    trueExpr: FuncAstExpr,
    falseExpr: FuncAstExpr,
): FuncAstTernaryExpr {
    return { kind: "ternary_expr", cond, trueExpr, falseExpr };
}

export function makeModule(entries: FuncAstModuleEntry[] = []): FuncAstModule {
    return { kind: "module", entries };
}
