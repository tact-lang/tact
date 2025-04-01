/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import type { Slice } from "@/core/boc/slice";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L273
// update_hashes#72 {X:Type} old_hash:bits256 new_hash:bits256
//  = HASH_UPDATE X;

export type HashUpdate = { oldHash: Buffer; newHash: Buffer };

export function loadHashUpdate(slice: Slice): HashUpdate {
    if (slice.loadUint(8) !== 0x72) {
        throw Error("Invalid data");
    }
    const oldHash = slice.loadBuffer(32);
    const newHash = slice.loadBuffer(32);
    return { oldHash, newHash };
}

export function storeHashUpdate(src: HashUpdate) {
    return (builder: Builder) => {
        builder.storeUint(0x72, 8);
        builder.storeBuffer(src.oldHash);
        builder.storeBuffer(src.newHash);
    };
}
