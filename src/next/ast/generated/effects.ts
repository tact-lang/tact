import type * as $ from "@/next/ast/effects";

export type Effects = $.Effects;
export const Effects = (
    returnOrThrow: boolean,
    setSelfPaths: ReadonlySet<string>,
): $.Effects => Object.freeze({ returnOrThrow, setSelfPaths });
