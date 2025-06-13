/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import { decodeTypeParams } from "@/next/types/type-params";
import { decodeTypeLazy } from "@/next/types/type";

export function* decodeAlias(
    Lazy: Ast.ThunkBuilder,
    { typeParams, type }: Ast.AliasDecl,
    scopeRef: () => Ast.CSource,
): Ast.Log<Ast.CAlias> {
    const decodedParams = yield* decodeTypeParams(typeParams);
    return Ast.CAlias(
        decodedParams,
        decodeTypeLazy(Lazy, decodedParams, type, scopeRef),
    );
}
