/* eslint-disable no-inner-declarations */
import * as Ast from "@/next/ast";
import { assignType, decodeTypeLazy } from "@/next/types/type";
import { decodeExpr } from "@/next/types/expression";
import { evalExpr } from "@/next/types/expr-eval";
import { emptyTypeParams } from "@/next/types/type-params";

export function decodeConstantDef(
    Lazy: Ast.ThunkBuilder,
    defLoc: Ast.Loc,
    typeParams: Ast.CTypeParams,
    { type, initializer }: Ast.ConstantDef,
    scopeRef: () => Ast.CSource,
    selfType: undefined | Ast.SelfType,
): [Ast.Thunk<Ast.CType>, Ast.Thunk<Ast.Value | undefined>] {
    if (type) {
        // if there is an ascribed type, that's the one we return
        const ascribedType = decodeTypeLazy(Lazy, typeParams, type, scopeRef);
        // also we have to check that it's the expected type prior to
        // evaluating the expression
        function* evaluate(Lazy: Ast.ThunkBuilder) {
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
                defLoc,
                emptyTypeParams,
                ascribed,
                computed,
                false,
            );
            return yield* evalExpr(expr.value, scopeRef);
        }
        const lazyExpr = Lazy({
            loc: defLoc,
            context: [Ast.TEText("evaluating expression")],
            recover: undefined,
            callback: evaluate,
        });
        return [ascribedType, lazyExpr];
    } else {
        // first we decode expression
        const expr = Lazy({
            callback: (Lazy) =>
                decodeExpr(
                    Lazy,
                    typeParams,
                    initializer,
                    scopeRef,
                    selfType,
                    new Map(),
                ),
            context: [Ast.TEText("parsing expression")],
            loc: defLoc,
            recover: undefined,
        });
        // then we evaluate it without any other checks
        const lazyExpr = Lazy({
            callback: function* () {
                const ast = yield* expr();
                return ast && (yield* evalExpr(ast.value, scopeRef));
            },
            context: [Ast.TEText("evaluating expression")],
            loc: defLoc,
            recover: undefined,
        });
        // resulting type is whatever the type expression has
        const computedType = Lazy({
            callback: function* () {
                return (yield* expr())?.value.computedType ?? Ast.CTypeRecover();
            },
            context: [],
            loc: defLoc,
            recover: Ast.CTypeRecover(),
        });
        return [computedType, lazyExpr];
    }
}
