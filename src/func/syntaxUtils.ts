import { FuncAstExpr, FuncAstIdExpr, FuncAstCallExpr } from "./syntax";

export function makeId(value: string): FuncAstIdExpr {
    return { kind: "id_expr", value };
}

export function makeCall(
    fun: FuncAstIdExpr | string,
    args: FuncAstExpr[],
): FuncAstCallExpr {
    return {
        kind: "call_expr",
        fun: typeof fun === "string" ? makeId(fun) : fun,
        args,
    };
}
