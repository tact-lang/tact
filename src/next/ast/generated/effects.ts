import type * as $ from "@/next/ast/effects";

export type Effects = $.Effects;
export const Effects = (
    mayRead: boolean,
    mayWrite: boolean,
    mustThrow: boolean,
    mustSetSelf: ReadonlySet<string>,
): $.Effects => Object.freeze({
    mayRead,
    mayWrite,
    mustThrow,
    mustSetSelf,
});
