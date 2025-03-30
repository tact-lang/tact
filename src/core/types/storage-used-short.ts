/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L225
// storage_used_short$_ cells:(VarUInteger 7)
//  bits:(VarUInteger 7) = StorageUsedShort;

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";

export type StorageUsedShort = {
    cells: bigint;
    bits: bigint;
};

export function loadStorageUsedShort(slice: Slice): StorageUsedShort {
    const cells = slice.loadVarUintBig(3);
    const bits = slice.loadVarUintBig(3);
    return {
        cells,
        bits,
    };
}

export function storeStorageUsedShort(src: StorageUsedShort) {
    return (builder: Builder) => {
        builder.storeVarUint(src.cells, 3);
        builder.storeVarUint(src.bits, 3);
    };
}
