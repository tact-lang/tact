/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L222
// storage_used$_ cells:(VarUInteger 7) bits:(VarUInteger 7)
//  public_cells:(VarUInteger 7) = StorageUsed;

export type StorageUsed = {
    cells: bigint;
    bits: bigint;
    publicCells: bigint;
};

export function loadStorageUsed(cs: Slice): StorageUsed {
    return {
        cells: cs.loadVarUintBig(3),
        bits: cs.loadVarUintBig(3),
        publicCells: cs.loadVarUintBig(3),
    };
}

export function storeStorageUsed(src: StorageUsed) {
    return (builder: Builder) => {
        builder.storeVarUint(src.cells, 3);
        builder.storeVarUint(src.bits, 3);
        builder.storeVarUint(src.publicCells, 3);
    };
}
