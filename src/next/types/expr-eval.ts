/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";

export function* evalExpr(
    expr: Ast.CExpr,
    scopeRef: () => Ast.CSource,
): Ast.Log<Ast.Value> {
    return Ast.VNumber(0n, expr.loc);
}
