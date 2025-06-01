/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { evalExpr } from "@/next/types/expr-eval";
import { decodeExpr } from "@/next/types/expression";
import { assignType, decodeTypeLazy } from "@/next/types/type";
import { emptyTypeParams } from "@/next/types/type-params";

export function* decodeFields(
    fields: readonly Ast.FieldDecl[],
    typeParams: Ast.TypeParams,
    scopeRef: () => Ast.Scope,
) {
    const order: string[] = [];
    const all: Map<string, [Ast.Loc, Ast.InhFieldSig]> = new Map();
    for (const field of fields) {
        const { initializer, loc } = field;
        const name = field.name.text;

        const prev = all.get(name);
        if (prev) {
            const [prevLoc] = prev;
            yield EDuplicateField(name, prevLoc, loc);
            continue;
        }

        const ascribedType = decodeTypeLazy(
            typeParams,
            field.type,
            scopeRef,
        );

        const lazyExpr = initializer ? Ast.Lazy(function* () {
            const expr = yield* decodeExpr(
                typeParams,
                initializer,
                scopeRef,
                undefined,
                new Map(),
            );
            const computed = expr.computedType;
            const ascribed = yield* ascribedType();
            yield* assignType(expr.loc, emptyTypeParams, ascribed, computed, false);
            return yield* evalExpr(expr, scopeRef);
        }) : undefined;

        order.push(name);
        all.set(name, [loc, Ast.InhFieldSig(ascribedType, lazyExpr)]);
    }

    const map = new Map([...all].map(([name, [, field]]) => [name, field]));
    return Ast.Ordered(order, map);
}

const EDuplicateField = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Duplicate field ${name}`),
        E.TEText(`New definition:`),
        E.TECode(next),
        E.TEText(`Previously defined at:`),
        E.TECode(prev),
    ],
});