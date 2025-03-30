/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";
import type { Maybe } from "../utils/maybe";
import type { AccountStatusChange } from "./account-status-change";
import {
    loadAccountStatusChange,
    storeAccountStatusChange,
} from "./account-status-change";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L284
// tr_phase_storage$_ storage_fees_collected:Grams
//   storage_fees_due:(Maybe Grams)
//   status_change:AccStatusChange
//   = TrStoragePhase;

export type TransactionStoragePhase = {
    storageFeesCollected: bigint;
    storageFeesDue?: Maybe<bigint>;
    statusChange: AccountStatusChange;
};

export function loadTransactionStoragePhase(
    slice: Slice,
): TransactionStoragePhase {
    const storageFeesCollected = slice.loadCoins();
    let storageFeesDue: Maybe<bigint> = undefined;
    if (slice.loadBit()) {
        storageFeesDue = slice.loadCoins();
    }
    const statusChange = loadAccountStatusChange(slice);
    return {
        storageFeesCollected,
        storageFeesDue,
        statusChange,
    };
}

export function storeTransactionsStoragePhase(src: TransactionStoragePhase) {
    return (builder: Builder) => {
        builder.storeCoins(src.storageFeesCollected);
        if (src.storageFeesDue === null || src.storageFeesDue === undefined) {
            builder.storeBit(false);
        } else {
            builder.storeBit(true);
            builder.storeCoins(src.storageFeesDue);
        }
        builder.store(storeAccountStatusChange(src.statusChange));
    };
}
