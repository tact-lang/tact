/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import type { Slice } from "@/core/boc/slice";
import type { Maybe } from "@/core/utils/maybe";
import type { CurrencyCollection } from "@/core/types/currency-collection";
import {
    loadCurrencyCollection,
    storeCurrencyCollection,
} from "@/core/types/currency-collection";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L293
// tr_phase_credit$_ due_fees_collected:(Maybe Grams)
//   credit:CurrencyCollection = TrCreditPhase;

export type TransactionCreditPhase = {
    dueFeesCollected?: Maybe<bigint>;
    credit: CurrencyCollection;
};

export function loadTransactionCreditPhase(
    slice: Slice,
): TransactionCreditPhase {
    const dueFeesCollected = slice.loadBit() ? slice.loadCoins() : undefined;
    const credit = loadCurrencyCollection(slice);
    return {
        dueFeesCollected,
        credit,
    };
}

export function storeTransactionCreditPhase(src: TransactionCreditPhase) {
    return (builder: Builder) => {
        if (
            src.dueFeesCollected === null ||
            src.dueFeesCollected === undefined
        ) {
            builder.storeBit(false);
        } else {
            builder.storeBit(true);
            builder.storeCoins(src.dueFeesCollected);
        }
        builder.store(storeCurrencyCollection(src.credit));
    };
}
