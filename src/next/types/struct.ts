/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import type * as E from "@/next/types/errors";
import { decodeFields } from "@/next/types/struct-fields";
import { decodeTypeParams } from "@/next/types/type-params";

export function* decodeStruct(
    struct: Ast.StructDecl,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.StructSig> {
    const typeParams = yield* decodeTypeParams(struct.typeParams);
    const fields = yield* decodeFields(struct.fields, typeParams, scopeRef);
    return Ast.StructSig(typeParams, fields);
}
