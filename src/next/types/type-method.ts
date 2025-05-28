import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";

export function* assignMethodType(
    prev: Ast.DecodedMethodType,
    next: Ast.DecodedMethodType,
    scopeRef: () => Ast.Scope
): E.WithLog<void> {

}