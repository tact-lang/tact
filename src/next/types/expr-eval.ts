/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import type * as E from "@/next/types/errors";

export function* evalExpr(
    expr: Ast.DecodedExpression,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.Value> {
    return Ast.VNumber(0n);
}
