/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";
import type { AccountState } from "./account-state";
import { loadAccountState, storeAccountState } from "./account-state";
import type { CurrencyCollection } from "./currency-collection";
import {
    loadCurrencyCollection,
    storeCurrencyCollection,
} from "./currency-collection";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L235
// account_storage$_ last_trans_lt:uint64 balance:CurrencyCollection state:AccountState
//   = AccountStorage;

export type AccountStorage = {
    lastTransLt: bigint;
    balance: CurrencyCollection;
    state: AccountState;
};

export function loadAccountStorage(slice: Slice): AccountStorage {
    return {
        lastTransLt: slice.loadUintBig(64),
        balance: loadCurrencyCollection(slice),
        state: loadAccountState(slice),
    };
}

export function storeAccountStorage(src: AccountStorage) {
    return (builder: Builder) => {
        builder.storeUint(src.lastTransLt, 64);
        builder.store(storeCurrencyCollection(src.balance));
        builder.store(storeAccountState(src.state));
    };
}
