import type { Loc } from "@/next/ast/common";

export type Value = VNumber

export type VNumber = {
    readonly kind: 'number';
    readonly value: bigint;
    // loc of expression that resulted in this value
    readonly loc: Loc;
}
