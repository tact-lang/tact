import type { TactImport, TactSource } from "@/next/imports/source";
import { hideProperty } from "@/utils/tricks";
import type * as Ast from "@/next/ast";

// provenance for definition: where did it come from
export type Via = ViaUser | ViaBuiltin

// is defined in compiler, always was there
export type ViaBuiltin = {
    readonly kind: 'builtin';
}

export const ViaBuiltin = (): ViaBuiltin => ({ kind: 'builtin' });

export type ViaUser = {
    readonly kind: 'user';
    // which imports it came through
    readonly imports: readonly TactImport[];
    // where in the code it was defined
    readonly defLoc: Ast.Loc;
    // in which source
    readonly source: TactSource;
}

// when something was just defined
export const ViaOrigin = (defLoc: Ast.Loc, source: TactSource): ViaUser => {
    const result: ViaUser = {
        kind: 'user',
        imports: [],
        defLoc,
        source,
    };
    hideProperty(result, 'source');
    return result;
};

// when it came through an import
export const ViaImport = (throughImport: TactImport, via: ViaUser): ViaUser => {
    const result: ViaUser = {
        kind: 'user',
        imports: [throughImport, ...via.imports],
        defLoc: via.defLoc,
        source: via.source,
    };
    hideProperty(result, 'source');
    return result;
};