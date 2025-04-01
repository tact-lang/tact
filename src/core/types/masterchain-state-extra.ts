/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Cell } from "@/core/boc/cell";
import type { Slice } from "@/core/boc/slice";
import { Dictionary } from "@/core/dict/dictionary";
import type { CurrencyCollection } from "@/core/types/currency-collection";
import { loadCurrencyCollection } from "@/core/types/currency-collection";

// Source: https://github.com/ton-foundation/ton/blob/ae5c0720143e231c32c3d2034cfe4e533a16d969/crypto/block/block.tlb#L509
// _ config_addr:bits256 config:^(Hashmap 32 ^Cell)
//  = ConfigParams;
// Source: https://github.com/ton-foundation/ton/blob/ae5c0720143e231c32c3d2034cfe4e533a16d969/crypto/block/block.tlb#L534
// masterchain_state_extra#cc26
//  shard_hashes:ShardHashes
//  config:ConfigParams
//  ^[ flags:(## 16) { flags <= 1 }
//     validator_info:ValidatorInfo
//     prev_blocks:OldMcBlocksInfo
//     after_key_block:Bool
//     last_key_block:(Maybe ExtBlkRef)
//     block_create_stats:(flags . 0)?BlockCreateStats ]
//  global_balance:CurrencyCollection
// = McStateExtra;

export type MasterchainStateExtra = {
    configAddress: bigint;
    config: Dictionary<number, Cell>;
    globalBalance: CurrencyCollection;
};

export function loadMasterchainStateExtra(cs: Slice): MasterchainStateExtra {
    // Check magic
    if (cs.loadUint(16) !== 0xcc26) {
        throw Error("Invalid data");
    }

    // Skip shard_hashes
    if (cs.loadBit()) {
        cs.loadRef();
    }

    // Read config
    const configAddress = cs.loadUintBig(256);
    const config = Dictionary.load(
        Dictionary.Keys.Int(32),
        Dictionary.Values.Cell(),
        cs,
    );

    // Rad global balance
    const globalBalance = loadCurrencyCollection(cs);

    return {
        config,
        configAddress,
        globalBalance,
    };
}
