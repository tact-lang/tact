import type { ModuleItems, Loc } from "@/next/ast";

export type TactSource = {
    readonly kind: "tact";
    readonly path: string;
    readonly code: string;
    readonly imports: readonly ResolvedImport[];
    readonly items: ModuleItems;
};

export type ResolvedImport = TactImport | FuncImport;
export type TactImport = {
    readonly kind: "tact";
    readonly source: TactSource;
    readonly loc: Loc | Implicit;
};
export type FuncImport = {
    readonly kind: "func";
    readonly code: string;
    readonly loc: Loc;
};

export type Implicit = {
    readonly kind: "implicit";
}
