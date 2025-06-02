import type * as $ from "@/next/ast/via";
import type * as $c from "@/next/ast/common";
import type { TactImport, TactSource } from "@/next/imports/source";
import { hideProperty } from "@/utils/tricks";

export type Via = $.Via;
export type ViaBuiltin = $.ViaBuiltin;
export type ViaUser = $.ViaUser;
export type ViaMember = $.ViaMember;

export const ViaBuiltin = (): $.ViaBuiltin => ({ kind: "builtin" });

// when something was just defined
export const ViaOrigin = (defLoc: $c.Loc, source: TactSource): $.ViaUser => {
    const result: $.ViaUser = {
        kind: "user",
        imports: [],
        defLoc,
        source,
    };
    hideProperty(result, "source");
    return result;
};

// when it came through an import
export const ViaImport = (
    throughImport: TactImport,
    via: $.ViaUser,
): $.ViaUser => {
    const result: $.ViaUser = {
        kind: "user",
        imports: [throughImport, ...via.imports],
        defLoc: via.defLoc,
        source: via.source,
    };
    hideProperty(result, "source");
    return result;
};

export const ViaMemberOrigin = (
    parentName: string,
    defLoc: $c.Loc,
): $.ViaMember => ({ defLoc, parentName, traits: [] });

export const ViaMemberTrait = (
    parentName: string,
    defLoc: $c.Loc,
    via: $.ViaMember,
): $.ViaMember => ({
    defLoc,
    parentName,
    traits: [[via.parentName, via.defLoc], ...via.traits],
});
