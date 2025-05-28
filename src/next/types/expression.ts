import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import type { TactImport, TactSource } from "@/next/imports/source";
import { builtinFunctions } from "@/next/types/builtins";
import { decodeFnType } from "@/next/types/type-fn";

export function* decodeExpr(
    node: Ast.Expression,
    scopeRef: () => Ast.Scope,
): Ast.Lazy<Ast.DecodedExpression> {

}