/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { throwInternal } from "@/error/errors";
import * as Ast from "@/next/ast";
import { Int } from "@/next/types/builtins";
import * as E from "@/next/types/errors";
import { evalExpr } from "@/next/types/expr-eval";
import { decodeExpr } from "@/next/types/expression";
import { decodeFields } from "@/next/types/struct-fields";
import { assignType } from "@/next/types/type";
import { highest32ofSha256, sha256 } from "@/utils/sha256";

export function* decodeMessage(
    message: Ast.MessageDecl,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.MessageSig> {
    const typeParams = Ast.TypeParams([], new Set());
    const fields = yield* decodeFields(
        message.fields, 
        typeParams, 
        scopeRef,
    );
    const lazyExpr = Ast.Lazy(function* () {
        const opcode = yield* decodeOpcode(
            typeParams,
            message.opcode,
            message.name.text,
            fields.order,
            scopeRef,
        );
        if (opcode === 0n) {
            yield EZero(message.loc);
        } else if (opcode < 0n) {
            yield ENegative(message.loc);
        } else if (opcode > 0xffff_ffff) {
            yield ETooLarge(message.loc);
        }
        return opcode;
    });

    return Ast.MessageSig(lazyExpr, fields);
}
const EZero = (
    next: Ast.Loc,
): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Zero opcode is reserved for text comments`),
    ],
});
const ENegative = (
    next: Ast.Loc,
): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Opcode must be positive`),
    ],
});
const ETooLarge = (
    next: Ast.Loc,
): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Opcode is too large`),
    ],
});

function* decodeOpcode(
    typeParams: Ast.TypeParams, 
    opcode: Ast.Expression | undefined,
    messageName: string,
    fieldsNames: readonly string[],
    scopeRef: () => Ast.Scope,
) {
    if (opcode) {
        const expr = yield* decodeExpr(
            typeParams,
            opcode,
            scopeRef,
            undefined,
            new Map(),
        );
        const computed = expr.computedType;
        if (yield* assignType(opcode.loc, Int, computed)) {
            const result = yield* evalExpr(expr, scopeRef);
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
            if (result.kind === 'number') {
                return result.value
            } else {
                return throwInternal("Const eval returned non-number for Int")
            }
        }
    }
    const signature = messageName + "{" + fieldsNames.join(",") + "}";
    return highest32ofSha256(sha256(signature));
}
