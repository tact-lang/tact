/* eslint-disable no-inner-declarations */
import * as Ast from "@/next/ast";
import { assignType, decodeTypeLazy } from "@/next/types/type";
import { decodeExpr } from "@/next/types/expression";
import { evalExpr } from "@/next/types/expr-eval";
import { emptyTypeParams } from "@/next/types/type-params";

export function decodeConstantDef(
    Lazy: Ast.ThunkBuilder,
    defLoc: Ast.Loc,
    typeParams: Ast.TypeParams,
    { type, initializer }: Ast.ConstantDef,
    scopeRef: () => Ast.Scope,
    selfType: undefined | Ast.SelfType,
): [Ast.Thunk<Ast.DecodedType>, Ast.Thunk<Ast.Value | undefined>] {
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
            const computed = expr.computedType;
            const ascribed = yield* ascribedType();
            yield* assignType(
                defLoc,
                emptyTypeParams,
                ascribed,
                computed,
                false,
            );
            return yield* evalExpr(expr, scopeRef);
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
                return ast && (yield* evalExpr(ast, scopeRef));
            },
            context: [Ast.TEText("evaluating expression")],
            loc: defLoc,
            recover: undefined,
        });
        // resulting type is whatever the type expression has
        const computedType = Lazy({
            callback: function* () {
                return (yield* expr())?.computedType ?? Ast.DTypeRecover();
            },
            context: [],
            loc: defLoc,
            recover: Ast.DTypeRecover(),
        });
        return [computedType, lazyExpr];
    }
}
