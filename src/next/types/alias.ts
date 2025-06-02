/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import type * as E from "@/next/types/errors";
import { decodeTypeParams } from "@/next/types/type-params";
import { decodeTypeLazy } from "@/next/types/type";

export function* decodeAlias(
    Lazy: Ast.ThunkBuilder,
    { typeParams, type }: Ast.AliasDecl,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.AliasSig> {
    const decodedParams = yield* decodeTypeParams(typeParams);
    return Ast.AliasSig(
        decodedParams,
        decodeTypeLazy(Lazy, decodedParams, type, scopeRef),
    );
}
