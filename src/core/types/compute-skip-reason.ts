/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L306
//  cskip_no_state$00 = ComputeSkipReason;
//  cskip_bad_state$01 = ComputeSkipReason;
//  cskip_no_gas$10 = ComputeSkipReason;

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";

export type ComputeSkipReason = "no-state" | "bad-state" | "no-gas";

export function loadComputeSkipReason(slice: Slice): ComputeSkipReason {
    const reason = slice.loadUint(2);
    if (reason === 0x00) {
        return "no-state";
    } else if (reason === 0x01) {
        return "bad-state";
    } else if (reason === 0x02) {
        return "no-gas";
    }
    throw new Error(`Unknown ComputeSkipReason: ${reason}`);
}

export function storeComputeSkipReason(src: ComputeSkipReason) {
    return (builder: Builder) => {
        if (src === "no-state") {
            builder.storeUint(0x00, 2);
        } else if (src === "bad-state") {
            builder.storeUint(0x01, 2);
        } else if (src === "no-gas") {
            builder.storeUint(0x02, 2);
        } else {
            throw new Error(`Unknown ComputeSkipReason: ${src}`);
        }
    };
}
