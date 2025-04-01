/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Slice } from "@/core/boc/slice";
import type { Dictionary } from "@/core/dict/dictionary";
import type { Maybe } from "@/core/utils/maybe";
import type { MasterchainStateExtra } from "@/core/types/masterchain-state-extra";
import { loadMasterchainStateExtra } from "@/core/types/masterchain-state-extra";
import type { ShardAccountRef } from "@/core/types/shard-accounts";
import { loadShardAccounts } from "@/core/types/shard-accounts";
import type { ShardIdent } from "@/core/types/shard-ident";
import { loadShardIdent } from "@/core/types/shard-ident";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L396
// shard_state#9023afe2 global_id:int32
//  shard_id:ShardIdent
//  seq_no:uint32 vert_seq_no:#
//  gen_utime:uint32 gen_lt:uint64
//  min_ref_mc_seqno:uint32
//  out_msg_queue_info:^OutMsgQueueInfo
//  before_split:(## 1)
//  accounts:^ShardAccounts
//  ^[ overload_history:uint64 underload_history:uint64
//  total_balance:CurrencyCollection
//  total_validator_fees:CurrencyCollection
//  libraries:(HashmapE 256 LibDescr)
//  master_ref:(Maybe BlkMasterInfo) ]
//  custom:(Maybe ^McStateExtra)
//  = ShardStateUnsplit;

export type ShardStateUnsplit = {
    globalId: number;
    shardId: ShardIdent;
    seqno: number;
    vertSeqNo: number;
    genUtime: number;
    genLt: bigint;
    minRefMcSeqno: number;
    beforeSplit: boolean;
    accounts?: Maybe<Dictionary<bigint, ShardAccountRef>>;
    extras?: Maybe<MasterchainStateExtra>;
};

export function loadShardStateUnsplit(cs: Slice): ShardStateUnsplit {
    if (cs.loadUint(32) !== 0x9023afe2) {
        throw Error("Invalid data");
    }
    const globalId = cs.loadInt(32);
    const shardId = loadShardIdent(cs);
    const seqno = cs.loadUint(32);
    const vertSeqNo = cs.loadUint(32);
    const genUtime = cs.loadUint(32);
    const genLt = cs.loadUintBig(64);
    const minRefMcSeqno = cs.loadUint(32);

    // Skip OutMsgQueueInfo: usually exotic
    cs.loadRef();

    const beforeSplit = cs.loadBit();

    // Parse accounts
    const shardAccountsRef = cs.loadRef();
    let accounts: Dictionary<bigint, ShardAccountRef> | undefined = undefined;
    if (!shardAccountsRef.isExotic) {
        accounts = loadShardAccounts(shardAccountsRef.beginParse());
    }

    // Skip (not used by apps)
    cs.loadRef();

    // Parse extras
    const mcStateExtra = cs.loadBit();
    let extras: MasterchainStateExtra | null = null;
    if (mcStateExtra) {
        const cell = cs.loadRef();
        if (!cell.isExotic) {
            extras = loadMasterchainStateExtra(cell.beginParse());
        }
    }

    return {
        globalId,
        shardId,
        seqno,
        vertSeqNo,
        genUtime,
        genLt,
        minRefMcSeqno,
        beforeSplit,
        accounts,
        extras,
    };
}
