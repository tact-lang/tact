/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";
import { evalExpr } from "@/next/types/expr-eval";
import { decodeExpr } from "@/next/types/expression";
import { assignType, decodeTypeLazy } from "@/next/types/type";
import { emptyTypeParams } from "@/next/types/type-params";

export function* decodeFields(
    Lazy: Ast.ThunkBuilder,
    fields: readonly Ast.FieldDecl[],
    typeParams: Ast.CTypeParams,
    scopeRef: () => Ast.CSource,
) {
    const order: string[] = [];
    const all: Map<string, [Ast.Loc, Ast.CField]> = new Map();
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
            Lazy,
            typeParams,
            field.type,
            scopeRef,
        );

        const lazyExpr = decodeInitializerLazy(
            Lazy,
            loc,
            typeParams,
            ascribedType,
            initializer,
            undefined,
            scopeRef,
        );

        order.push(name);
        all.set(name, [loc, Ast.CField(ascribedType, lazyExpr)]);
    }

    const map = new Map([...all].map(([name, [, field]]) => [name, field]));
    return Ast.Ordered(order, map);
}

export function decodeInitializerLazy(
    Lazy: Ast.ThunkBuilder,
    loc: Ast.Loc,
    typeParams: Ast.CTypeParams,
    ascribedType: Ast.Thunk<Ast.CType>,
    initializer: Ast.Expression | undefined,
    selfType: undefined | Ast.SelfType,
    scopeRef: () => Ast.CSource,
) {
    if (!initializer) {
        return undefined;
    }
    return Lazy({
        callback: function* (Lazy) {
            const expr = yield* decodeExpr(
                Lazy,
                typeParams,
                initializer,
                scopeRef,
                selfType,
                new Map(),
            );
            const computed = expr.value.computedType;
            const ascribed = yield* ascribedType();
            yield* assignType(
                expr.value.loc,
                emptyTypeParams,
                ascribed,
                computed,
                false,
            );
            return yield* evalExpr(expr.value, scopeRef);
        },
        context: [Ast.TEText("evaluating initial field value")],
        loc,
        recover: undefined,
    });
}

const EDuplicateField = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Duplicate field ${name}`),
        Ast.TEText(`New definition:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});
