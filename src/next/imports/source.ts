import type { ModuleItem, Range } from "@/next/ast";

export type TactSource = {
    readonly code: string;
    readonly imports: readonly ResolvedImport[];
    readonly items: readonly ModuleItem[];
};
export type ResolvedImport = TactImport | FuncImport;
export type TactImport = {
    readonly kind: "tact";
    readonly source: TactSource;
    readonly loc: Range;
};
export type FuncImport = {
    readonly kind: "func";
    readonly code: string;
    readonly loc: Range;
};
