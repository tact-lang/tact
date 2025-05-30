/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type { Loc } from "@/next/ast/common";
import type * as $ from "@/next/ast/value";

export type VNumber = $.VNumber;
export const VNumber = (value: bigint, loc: Loc): $.VNumber => Object.freeze({
    kind: "number",
    value,
    loc
});
export const isVNumber = ($value: VNumber) => $value.kind === "number";
export type Value = $.Value;
