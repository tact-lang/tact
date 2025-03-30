/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";
import type { StateInit } from "./state-init";
import { loadStateInit, storeStateInit } from "./state-init";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L239
// account_uninit$00 = AccountState;
// account_active$1 _:StateInit = AccountState;
// account_frozen$01 state_hash:bits256 = AccountState;

export type AccountState =
    | AccountStateUninit
    | AccountStateActive
    | AccountStateFrozen;

export type AccountStateUninit = { type: "uninit" };
export type AccountStateActive = { type: "active"; state: StateInit };
export type AccountStateFrozen = { type: "frozen"; stateHash: bigint };

export function loadAccountState(cs: Slice): AccountState {
    if (cs.loadBit()) {
        return { type: "active", state: loadStateInit(cs) };
    } else if (cs.loadBit()) {
        return { type: "frozen", stateHash: cs.loadUintBig(256) };
    } else {
        return { type: "uninit" };
    }
}

export function storeAccountState(src: AccountState) {
    return (builder: Builder) => {
        if (src.type === "active") {
            builder.storeBit(true);
            builder.store(storeStateInit(src.state));
        } else if (src.type === "frozen") {
            builder.storeBit(false);
            builder.storeBit(true);
            builder.storeUint(src.stateHash, 256);
        } else if (src.type === "uninit") {
            builder.storeBit(false);
            builder.storeBit(false);
        }
    };
}
