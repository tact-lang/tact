/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import type { Slice } from "@/core/boc/slice";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L139
// tick_tock$_ tick:Bool tock:Bool = TickTock;

export type TickTock = {
    tick: boolean;
    tock: boolean;
};

export function loadTickTock(slice: Slice): TickTock {
    return {
        tick: slice.loadBit(),
        tock: slice.loadBit(),
    };
}

export function storeTickTock(src: TickTock) {
    return (builder: Builder) => {
        builder.storeBit(src.tick);
        builder.storeBit(src.tock);
    };
}
