/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L384
// shard_ident$00 shard_pfx_bits:(#<= 60)
//  workchain_id:int32 shard_prefix:uint64 = ShardIdent;

export type ShardIdent = {
    shardPrefixBits: number;
    workchainId: number;
    shardPrefix: bigint;
};

export function loadShardIdent(slice: Slice): ShardIdent {
    if (slice.loadUint(2) !== 0) {
        throw Error("Invalid data");
    }
    return {
        shardPrefixBits: slice.loadUint(6),
        workchainId: slice.loadInt(32),
        shardPrefix: slice.loadUintBig(64),
    };
}

export function storeShardIdent(src: ShardIdent) {
    return (builder: Builder) => {
        builder.storeUint(0, 2);
        builder.storeUint(src.shardPrefixBits, 6);
        builder.storeInt(src.workchainId, 32);
        builder.storeUint(src.shardPrefix, 64);
    };
}
