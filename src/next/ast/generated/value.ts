/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/value";

export type VNumber = $.VNumber;
export const VNumber = (value: bigint): $.VNumber => Object.freeze({
    kind: "number",
    value
});
export const isVNumber = ($value: VNumber) => $value.kind === "number";
export type Value = $.Value;
