import type { TactImport, TactSource } from "@/next/imports/source";

import type * as Ast from "@/next/ast";

// provenance for definition: where did it come from
export type Via = ViaUser | ViaBuiltin;

// is defined in compiler, always was there
export type ViaBuiltin = {
    readonly kind: "builtin";
};

export type ViaUser = {
    readonly kind: "user";
    // which imports it came through
    readonly imports: readonly TactImport[];
    // where in the code it was defined
    readonly defLoc: Ast.Loc;
    // in which source
    readonly source: TactSource;
};

export type ViaMember = {
    readonly traits: readonly [string, Ast.Loc][];
    readonly defLoc: Ast.Loc;
    readonly parentName: string;
};
