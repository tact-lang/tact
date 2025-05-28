import * as Ast from "@/next/ast";
import { assignType, decodeTypeLazy } from "@/next/types/type";
import { decodeExpr } from "@/next/types/expression";

export function decodeConstantDef(
    typeParams: Ast.TypeParams,
    init: Ast.ConstantDef,
    scopeRef: () => Ast.Scope,
): [Ast.Lazy<Ast.DecodedType>, Ast.Lazy<Ast.DecodedExpression>] {
    const { type, initializer } = init;

    const ascribedType = type
        ? decodeTypeLazy(typeParams, type, scopeRef)
        : undefined;

    const lazyExpr = decodeExpr(initializer, scopeRef);

    const decodedType = Ast.Lazy(function* () {
        const expr = yield* lazyExpr();
        const computed = yield* expr.computedType();
        if (!ascribedType) {
            return computed;   
        }
        const ascribed = yield* ascribedType();
        yield* assignType(
            ascribed,
            computed,
            scopeRef,
        );
        return ascribed;
    });

    return [decodedType, lazyExpr];
}