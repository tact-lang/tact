import * as Ast from "@/next/ast";
// import { hasStorageAccess } from "@/next/types/expression";

//               op                 read/write    throw
// 42            empty              false         false
// a ? b : c     a prod (b sum c)   a | b | c     a | (b & c)
// f(a, b)       a prod b           a | b         a | b
// a && b        a cond b           a | b         a
// a || b        a cond b           a | b         a

// true true      a b
// true false     a b
// false true     a
// false false    a

export const emptyEff = Ast.Effects(
    false, 
    false, 
    false, 
    new Set<string>(),
);

export const allEff = (
    effs: readonly Ast.Effects[],
) => Ast.Effects(
    effs.some(eff => eff.mayRead),
    effs.some(eff => eff.mayWrite),
    // if any of args throws, expr throws
    effs.some(eff => eff.mustThrow),
    new Set(effs.flatMap(eff => [...eff.mustSetSelf])),
);

export const anyEff = (
    effs: readonly Ast.Effects[],
) => Ast.Effects(
    effs.some(eff => eff.mayRead),
    effs.some(eff => eff.mayWrite),
    // if all of branches throw, expr throws
    effs.every(eff => eff.mustThrow),
    new Set(effs.flatMap(eff => [...eff.mustSetSelf])),
);

export const shortCircuitEff = (
    left: Ast.Effects,
    right: Ast.Effects,
) => Ast.Effects(
    left.mayRead || right.mayRead,
    left.mayWrite || right.mayWrite,
    // only if condition throws, we know it must throw
    // if condition doesn't throw, we can never evaluate second arg,
    // and it's not guaranteed to throw
    left.mustThrow,
    new Set([...left.mustSetSelf, ...right.mustSetSelf]),
);

export const exitEff = (eff: Ast.Effects): Ast.Effects => ({ ...eff, mustThrow: true });
export const assignEff = (eff: Ast.Effects): Ast.Effects => ({ ...eff, mustThrow: true });

export function hasStorageAccess(node: Ast.DecodedExpression, selfType: Ast.SelfType | undefined): boolean {
    // looking for `self.x.y.z`
    if (node.kind === 'field_access') {
        return hasStorageAccess(node.aggregate, selfType);
    } else if (node.kind === 'self') {
        return Boolean(
            selfType &&
            selfType.kind === 'type_ref' &&
            (selfType.type.kind === 'contract' || selfType.type.kind === 'trait')
        );
    } else {
        return false;
    }
}

