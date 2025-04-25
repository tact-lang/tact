import type { ModuleItem, Range } from "@/next/ast";

export type Source = TactSource | FuncSource;
export type TactSource = {
    readonly kind: "tact";
    readonly code: string;
    readonly imports: readonly ResolvedImport[];
    readonly items: readonly ModuleItem[];
};
export type FuncSource = {
    readonly kind: "func";
    readonly code: string;
    readonly imports: readonly FuncImport[];
}

export type ResolvedImport = TactImport | FuncImport;
export type TactImport = {
    readonly kind: "tact";
    readonly source: Source;
    readonly loc: Range;
};
export type FuncImport = {
    readonly kind: "func";
    readonly source: FuncSource;
    readonly loc: Range;
};
