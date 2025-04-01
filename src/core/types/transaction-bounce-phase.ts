/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import type { Slice } from "@/core/boc/slice";
import type { StorageUsedShort } from "@/core/types/storage-used-short";
import {
    loadStorageUsedShort,
    storeStorageUsedShort,
} from "@/core/types/storage-used-short";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L318
// tr_phase_bounce_negfunds$00 = TrBouncePhase;
// tr_phase_bounce_nofunds$01 msg_size:StorageUsedShort req_fwd_fees:Grams = TrBouncePhase;
// tr_phase_bounce_ok$1 msg_size:StorageUsedShort msg_fees:Grams fwd_fees:Grams = TrBouncePhase;

export type TransactionBouncePhase =
    | TransactionBounceNegativeFunds
    | TransactionBounceNoFunds
    | TransactionBounceOk;

export type TransactionBounceNegativeFunds = {
    type: "negative-funds";
};

export type TransactionBounceNoFunds = {
    type: "no-funds";
    messageSize: StorageUsedShort;
    requiredForwardFees: bigint;
};

export type TransactionBounceOk = {
    type: "ok";
    messageSize: StorageUsedShort;
    messageFees: bigint;
    forwardFees: bigint;
};

export function loadTransactionBouncePhase(
    slice: Slice,
): TransactionBouncePhase {
    // Ok
    if (slice.loadBit()) {
        const messageSize = loadStorageUsedShort(slice);
        const messageFees = slice.loadCoins();
        const forwardFees = slice.loadCoins();
        return {
            type: "ok",
            messageSize,
            messageFees,
            forwardFees,
        };
    }

    // No funds
    if (slice.loadBit()) {
        const messageSize = loadStorageUsedShort(slice);
        const requiredForwardFees = slice.loadCoins();
        return {
            type: "no-funds",
            messageSize,
            requiredForwardFees,
        };
    }

    // Negative funds
    return {
        type: "negative-funds",
    };
}

export function storeTransactionBouncePhase(src: TransactionBouncePhase) {
    return (builder: Builder) => {
        if (src.type === "ok") {
            builder.storeBit(true);
            builder.store(storeStorageUsedShort(src.messageSize));
            builder.storeCoins(src.messageFees);
            builder.storeCoins(src.forwardFees);
        } else if (src.type === "negative-funds") {
            builder.storeBit(false);
            builder.storeBit(false);
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        } else if (src.type === "no-funds") {
            builder.storeBit(false);
            builder.storeBit(true);
            builder.store(storeStorageUsedShort(src.messageSize));
            builder.storeCoins(src.requiredForwardFees);
        } else {
            throw new Error("Invalid TransactionBouncePhase type");
        }
    };
}
