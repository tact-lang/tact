import type * as Ast from "@/next/ast";
import type * as E from "@/next/types/errors";
import type { TactSource } from "@/next/imports/source";

export function decodeStatements(
    statements: readonly Ast.Statement[],
    scopeRef: () => Ast.Scope,
): readonly Ast.DecodedStatement[] {
    return [];
}