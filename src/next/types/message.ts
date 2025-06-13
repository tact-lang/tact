/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { throwInternal } from "@/error/errors";
import * as Ast from "@/next/ast";
import { Int } from "@/next/types/builtins";
import { evalExpr } from "@/next/types/expr-eval";
import { decodeExpr } from "@/next/types/expression";
import { decodeFields } from "@/next/types/struct-fields";
import { assignType } from "@/next/types/type";
import { emptyTypeParams } from "@/next/types/type-params";
import { highest32ofSha256, sha256 } from "@/utils/sha256";

export function* decodeMessage(
    Lazy: Ast.ThunkBuilder,
    message: Ast.MessageDecl,
    scopeRef: () => Ast.CSource,
): Ast.Log<Ast.CMessage> {
    const fields = yield* decodeFields(
        Lazy,
        message.fields,
        emptyTypeParams,
        scopeRef,
    );
    const lazyExpr = Lazy({
        callback: function* (Lazy) {
            const opcode = yield* decodeOpcode(
                Lazy,
                emptyTypeParams,
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
        },
        context: [Ast.TEText("computing opcode")],
        loc: message.loc,
        recover: undefined,
    });

    return Ast.CMessage(lazyExpr, fields);
}
const EZero = (next: Ast.Loc): Ast.TcError => ({
    loc: next,
    descr: [Ast.TEText(`Zero opcode is reserved for text comments`)],
});
const ENegative = (next: Ast.Loc): Ast.TcError => ({
    loc: next,
    descr: [Ast.TEText(`Opcode must be positive`)],
});
const ETooLarge = (next: Ast.Loc): Ast.TcError => ({
    loc: next,
    descr: [Ast.TEText(`Opcode is too large`)],
});

function* decodeOpcode(
    Lazy: Ast.ThunkBuilder,
    typeParams: Ast.CTypeParams,
    opcode: Ast.Expression | undefined,
    messageName: string,
    fieldsNames: readonly string[],
    scopeRef: () => Ast.CSource,
) {
    if (opcode) {
        const expr = yield* decodeExpr(
            Lazy,
            typeParams,
            opcode,
            scopeRef,
            undefined,
            new Map(),
        );
        const computed = expr.value.computedType;
        if (
            yield* assignType(opcode.loc, emptyTypeParams, Int, computed, false)
        ) {
            const result = yield* evalExpr(expr.value, scopeRef);
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
            if (result.kind === "number") {
                return result.value;
            } else {
                return throwInternal("Const eval returned non-number for Int");
            }
        }
    }
    const signature = messageName + "{" + fieldsNames.join(",") + "}";
    return highest32ofSha256(sha256(signature));
}
