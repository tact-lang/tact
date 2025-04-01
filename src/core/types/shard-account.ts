/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import { beginCell } from "@/core/boc/builder";
import type { Slice } from "@/core/boc/slice";
import type { Maybe } from "@/core/utils/maybe";
import type { Account } from "@/core/types/account";
import { loadAccount, storeAccount } from "@/core/types/account";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L256
// account_descr$_ account:^Account last_trans_hash:bits256
//  last_trans_lt:uint64 = ShardAccount;

export type ShardAccount = {
    account?: Maybe<Account>;
    lastTransactionHash: bigint;
    lastTransactionLt: bigint;
};

export function loadShardAccount(slice: Slice): ShardAccount {
    const accountRef = slice.loadRef();
    let account: Account | undefined = undefined;
    if (!accountRef.isExotic) {
        const accountSlice = accountRef.beginParse();
        if (accountSlice.loadBit()) {
            account = loadAccount(accountSlice);
        }
    }

    return {
        account,
        lastTransactionHash: slice.loadUintBig(256),
        lastTransactionLt: slice.loadUintBig(64),
    };
}

export function storeShardAccount(src: ShardAccount) {
    return (builder: Builder) => {
        if (src.account) {
            builder.storeRef(
                beginCell().storeBit(true).store(storeAccount(src.account)),
            );
        } else {
            builder.storeRef(beginCell().storeBit(false));
        }
        builder.storeUint(src.lastTransactionHash, 256);
        builder.storeUint(src.lastTransactionLt, 64);
    };
}
