import * as Ast from "@/next/ast";
import { assignType, decodeTypeLazy } from "@/next/types/type";
import { decodeExpr } from "@/next/types/expression";
import { evalExpr } from "@/next/types/expr-eval";
import { emptyTypeParams } from "@/next/types/type-params";

export function decodeConstantDef(
    defLoc: Ast.Loc,
    typeParams: Ast.TypeParams,
    { type, initializer }: Ast.ConstantDef,
    scopeRef: () => Ast.Scope,
    selfType: undefined | Ast.SelfType,
): [Ast.Lazy<Ast.DecodedType>, Ast.Lazy<Ast.Value>] {
    if (type) {
        // if there is an ascribed type, that's the one we return
        const ascribedType = decodeTypeLazy(typeParams, type, scopeRef);
        // also we have to check that it's the expected type prior to
        // evaluating the expression
        const lazyExpr = Ast.Lazy(function* () {
            const expr = yield* decodeExpr(
                typeParams,
                initializer,
                scopeRef,
                selfType,
                new Map(),
            );
            const computed = expr.computedType;
            const ascribed = yield* ascribedType();
            yield* assignType(defLoc, emptyTypeParams, ascribed, computed, false);
            return yield* evalExpr(expr, scopeRef);
        });
        return [ascribedType, lazyExpr];
    } else {
        // first we decode expression
        const expr = Ast.Lazy(function* () {
            return yield* decodeExpr(
                typeParams,
                initializer,
                scopeRef,
                selfType,
                new Map(),
            );
        });
        // then we evaluate it without any other checks
        const lazyExpr = Ast.Lazy(function* () {
            return yield* evalExpr(yield* expr(), scopeRef);
        });
        // resulting type is whatever the type expression has
        const computedType = Ast.Lazy(function* () {
            return (yield* expr()).computedType;
        });
        return [computedType, lazyExpr];
    }
}
