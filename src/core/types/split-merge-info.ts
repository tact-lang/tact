/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L339
// split_merge_info$_ cur_shard_pfx_len:(## 6)
//   acc_split_depth:(## 6) this_addr:bits256 sibling_addr:bits256
//   = SplitMergeInfo;

export type SplitMergeInfo = {
    currentShardPrefixLength: number;
    accountSplitDepth: number;
    thisAddress: bigint;
    siblingAddress: bigint;
};

export function loadSplitMergeInfo(slice: Slice): SplitMergeInfo {
    const currentShardPrefixLength = slice.loadUint(6);
    const accountSplitDepth = slice.loadUint(6);
    const thisAddress = slice.loadUintBig(256);
    const siblingAddress = slice.loadUintBig(256);
    return {
        currentShardPrefixLength,
        accountSplitDepth,
        thisAddress,
        siblingAddress,
    };
}

export function storeSplitMergeInfo(src: SplitMergeInfo) {
    return (builder: Builder) => {
        builder.storeUint(src.currentShardPrefixLength, 6);
        builder.storeUint(src.accountSplitDepth, 6);
        builder.storeUint(src.thisAddress, 256);
        builder.storeUint(src.siblingAddress, 256);
    };
}
