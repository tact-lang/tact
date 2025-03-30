/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import type { Slice } from "../boc/slice";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L243
// acc_state_uninit$00 = AccountStatus;
// acc_state_frozen$01 = AccountStatus;
// acc_state_active$10 = AccountStatus;
// acc_state_nonexist$11 = AccountStatus;

export type AccountStatus =
    | "uninitialized"
    | "frozen"
    | "active"
    | "non-existing";

/**
 * Load account state from slice
 * @param slice
 * @returns AccountState
 */
export function loadAccountStatus(slice: Slice): AccountStatus {
    const status = slice.loadUint(2);
    if (status === 0x00) {
        return "uninitialized";
    }
    if (status === 0x01) {
        return "frozen";
    }
    if (status === 0x02) {
        return "active";
    }
    if (status === 0x03) {
        return "non-existing";
    }
    throw Error("Invalid data");
}

/**
 * Store account state to builder
 * @param src account state
 * @param builder buidler
 */
export function storeAccountStatus(src: AccountStatus) {
    return (builder: Builder) => {
        if (src === "uninitialized") {
            builder.storeUint(0x00, 2);
        } else if (src === "frozen") {
            builder.storeUint(0x01, 2);
        } else if (src === "active") {
            builder.storeUint(0x02, 2);
        } else if (src === "non-existing") {
            builder.storeUint(0x03, 2);
        } else {
            throw Error("Invalid data");
        }
        return builder;
    };
}
