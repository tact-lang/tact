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
import type { SplitMergeInfo } from "@/core/types/split-merge-info";
import { loadSplitMergeInfo, storeSplitMergeInfo } from "@/core/types/split-merge-info";
import type { Transaction } from "@/core/types/transaction";
import { loadTransaction, storeTransaction } from "@/core/types/transaction";
import type { TransactionActionPhase } from "@/core/types/transaction-action-phase";
import {
    loadTransactionActionPhase,
    storeTransactionActionPhase,
} from "@/core/types/transaction-action-phase";
import type { TransactionBouncePhase } from "@/core/types/transaction-bounce-phase";
import {
    loadTransactionBouncePhase,
    storeTransactionBouncePhase,
} from "@/core/types/transaction-bounce-phase";
import type { TransactionComputePhase } from "@/core/types/transaction-compute-phase";
import {
    loadTransactionComputePhase,
    storeTransactionComputePhase,
} from "@/core/types/transaction-compute-phase";
import type { TransactionCreditPhase } from "@/core/types/transaction-credit-phase";
import {
    loadTransactionCreditPhase,
    storeTransactionCreditPhase,
} from "@/core/types/transaction-credit-phase";
import type { TransactionStoragePhase } from "@/core/types/transaction-storage-phase";
import {
    loadTransactionStoragePhase,
    storeTransactionsStoragePhase,
} from "@/core/types/transaction-storage-phase";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L324
// trans_ord$0000 credit_first:Bool
//   storage_ph:(Maybe TrStoragePhase)
//   credit_ph:(Maybe TrCreditPhase)
//   compute_ph:TrComputePhase action:(Maybe ^TrActionPhase)
//   aborted:Bool bounce:(Maybe TrBouncePhase)
//   destroyed:Bool
//   = TransactionDescr;

// trans_storage$0001 storage_ph:TrStoragePhase
//   = TransactionDescr;

// trans_tick_tock$001 is_tock:Bool storage_ph:TrStoragePhase
//   compute_ph:TrComputePhase action:(Maybe ^TrActionPhase)
//   aborted:Bool destroyed:Bool = TransactionDescr;

// trans_split_prepare$0100 split_info:SplitMergeInfo
//   storage_ph:(Maybe TrStoragePhase)
//   compute_ph:TrComputePhase action:(Maybe ^TrActionPhase)
//   aborted:Bool destroyed:Bool
//   = TransactionDescr;

// trans_split_install$0101 split_info:SplitMergeInfo
//   prepare_transaction:^Transaction
//   installed:Bool = TransactionDescr;

// trans_merge_prepare$0110 split_info:SplitMergeInfo
//   storage_ph:TrStoragePhase aborted:Bool
//   = TransactionDescr;

// trans_merge_install$0111 split_info:SplitMergeInfo
//   prepare_transaction:^Transaction
//   storage_ph:(Maybe TrStoragePhase)
//   credit_ph:(Maybe TrCreditPhase)
//   compute_ph:TrComputePhase action:(Maybe ^TrActionPhase)
//   aborted:Bool destroyed:Bool
//   = TransactionDescr;

export type TransactionDescription =
    | TransactionDescriptionGeneric
    | TransactionDescriptionStorage
    | TransactionDescriptionTickTock
    | TransactionDescriptionSplitPrepare
    | TransactionDescriptionSplitInstall
    | TransactionDescriptionMergePrepare
    | TransactionDescriptionMergeInstall;

export type TransactionDescriptionGeneric = {
    type: "generic";
    creditFirst: boolean;
    storagePhase?: Maybe<TransactionStoragePhase>;
    creditPhase?: Maybe<TransactionCreditPhase>;
    computePhase: TransactionComputePhase;
    actionPhase?: Maybe<TransactionActionPhase>;
    bouncePhase?: Maybe<TransactionBouncePhase>;
    aborted: boolean;
    destroyed: boolean;
};

export type TransactionDescriptionStorage = {
    type: "storage";
    storagePhase: TransactionStoragePhase;
};

export type TransactionDescriptionTickTock = {
    type: "tick-tock";
    isTock: boolean;
    storagePhase: TransactionStoragePhase;
    computePhase: TransactionComputePhase;
    actionPhase?: Maybe<TransactionActionPhase>;
    aborted: boolean;
    destroyed: boolean;
};

export type TransactionDescriptionSplitPrepare = {
    type: "split-prepare";
    splitInfo: SplitMergeInfo;
    storagePhase?: Maybe<TransactionStoragePhase>;
    computePhase: TransactionComputePhase;
    actionPhase?: Maybe<TransactionActionPhase>;
    aborted: boolean;
    destroyed: boolean;
};

export type TransactionDescriptionSplitInstall = {
    type: "split-install";
    splitInfo: SplitMergeInfo;
    prepareTransaction: Transaction;
    installed: boolean;
};

export type TransactionDescriptionMergePrepare = {
    type: "merge-prepare";
    splitInfo: SplitMergeInfo;
    storagePhase: TransactionStoragePhase;
    aborted: boolean;
};

export type TransactionDescriptionMergeInstall = {
    type: "merge-install";
    splitInfo: SplitMergeInfo;
    prepareTransaction: Transaction;
    storagePhase?: Maybe<TransactionStoragePhase>;
    creditPhase?: Maybe<TransactionCreditPhase>;
    computePhase: TransactionComputePhase;
    actionPhase?: Maybe<TransactionActionPhase>;
    aborted: boolean;
    destroyed: boolean;
};

export function loadTransactionDescription(
    slice: Slice,
): TransactionDescription {
    const type = slice.loadUint(4);
    if (type === 0x00) {
        const creditFirst = slice.loadBit();
        let storagePhase: Maybe<TransactionStoragePhase> = undefined;
        if (slice.loadBit()) {
            storagePhase = loadTransactionStoragePhase(slice);
        }
        let creditPhase: Maybe<TransactionCreditPhase> = undefined;
        if (slice.loadBit()) {
            creditPhase = loadTransactionCreditPhase(slice);
        }
        const computePhase: TransactionComputePhase =
            loadTransactionComputePhase(slice);
        let actionPhase: Maybe<TransactionActionPhase> = undefined;
        if (slice.loadBit()) {
            actionPhase = loadTransactionActionPhase(
                slice.loadRef().beginParse(),
            );
        }
        const aborted = slice.loadBit();
        let bouncePhase: Maybe<TransactionBouncePhase> = undefined;
        if (slice.loadBit()) {
            bouncePhase = loadTransactionBouncePhase(slice);
        }
        const destroyed = slice.loadBit();
        return {
            type: "generic",
            creditFirst,
            storagePhase,
            creditPhase,
            computePhase,
            actionPhase,
            bouncePhase,
            aborted,
            destroyed,
        };
    }
    if (type === 0x01) {
        return {
            type: "storage",
            storagePhase: loadTransactionStoragePhase(slice),
        };
    }
    if (type === 0x2 || type === 0x03) {
        const isTock = type === 0x03;
        const storagePhase: TransactionStoragePhase =
            loadTransactionStoragePhase(slice);
        const computePhase: TransactionComputePhase =
            loadTransactionComputePhase(slice);
        let actionPhase: Maybe<TransactionActionPhase> = undefined;
        if (slice.loadBit()) {
            actionPhase = loadTransactionActionPhase(
                slice.loadRef().beginParse(),
            );
        }
        const aborted = slice.loadBit();
        const destroyed = slice.loadBit();
        return {
            type: "tick-tock",
            isTock,
            storagePhase,
            computePhase,
            actionPhase,
            aborted,
            destroyed,
        };
    }
    if (type === 0x04) {
        const splitInfo = loadSplitMergeInfo(slice);
        let storagePhase: Maybe<TransactionStoragePhase> = undefined;
        if (slice.loadBit()) {
            storagePhase = loadTransactionStoragePhase(slice);
        }
        const computePhase: TransactionComputePhase =
            loadTransactionComputePhase(slice);
        let actionPhase: Maybe<TransactionActionPhase> = undefined;
        if (slice.loadBit()) {
            actionPhase = loadTransactionActionPhase(
                slice.loadRef().beginParse(),
            );
        }
        const aborted = slice.loadBit();
        const destroyed = slice.loadBit();
        return {
            type: "split-prepare",
            splitInfo,
            storagePhase,
            computePhase,
            actionPhase,
            aborted,
            destroyed,
        };
    }
    if (type === 0x05) {
        const splitInfo = loadSplitMergeInfo(slice);
        const prepareTransaction = loadTransaction(
            slice.loadRef().beginParse(),
        );
        const installed = slice.loadBit();
        return {
            type: "split-install",
            splitInfo,
            prepareTransaction,
            installed,
        };
    }

    throw Error(`Unsupported transaction description type ${type}`);
}

export function storeTransactionDescription(src: TransactionDescription) {
    return (builder: Builder) => {
        if (src.type === "generic") {
            builder.storeUint(0x00, 4);
            builder.storeBit(src.creditFirst);
            if (src.storagePhase) {
                builder.storeBit(true);
                builder.store(storeTransactionsStoragePhase(src.storagePhase));
            } else {
                builder.storeBit(false);
            }
            if (src.creditPhase) {
                builder.storeBit(true);
                builder.store(storeTransactionCreditPhase(src.creditPhase));
            } else {
                builder.storeBit(false);
            }
            builder.store(storeTransactionComputePhase(src.computePhase));
            if (src.actionPhase) {
                builder.storeBit(true);
                builder.storeRef(
                    beginCell().store(
                        storeTransactionActionPhase(src.actionPhase),
                    ),
                );
            } else {
                builder.storeBit(false);
            }
            builder.storeBit(src.aborted);
            if (src.bouncePhase) {
                builder.storeBit(true);
                builder.store(storeTransactionBouncePhase(src.bouncePhase));
            } else {
                builder.storeBit(false);
            }
            builder.storeBit(src.destroyed);
        } else if (src.type === "storage") {
            builder.storeUint(0x01, 4);
            builder.store(storeTransactionsStoragePhase(src.storagePhase));
        } else if (src.type === "tick-tock") {
            builder.storeUint(src.isTock ? 0x03 : 0x02, 4);
            builder.store(storeTransactionsStoragePhase(src.storagePhase));
            builder.store(storeTransactionComputePhase(src.computePhase));
            if (src.actionPhase) {
                builder.storeBit(true);
                builder.storeRef(
                    beginCell().store(
                        storeTransactionActionPhase(src.actionPhase),
                    ),
                );
            } else {
                builder.storeBit(false);
            }
            builder.storeBit(src.aborted);
            builder.storeBit(src.destroyed);
        } else if (src.type === "split-prepare") {
            builder.storeUint(0x04, 4);
            builder.store(storeSplitMergeInfo(src.splitInfo));
            if (src.storagePhase) {
                builder.storeBit(true);
                builder.store(storeTransactionsStoragePhase(src.storagePhase));
            } else {
                builder.storeBit(false);
            }
            builder.store(storeTransactionComputePhase(src.computePhase));
            if (src.actionPhase) {
                builder.storeBit(true);
                builder.store(storeTransactionActionPhase(src.actionPhase));
            } else {
                builder.storeBit(false);
            }
            builder.storeBit(src.aborted);
            builder.storeBit(src.destroyed);
        } else if (src.type === "split-install") {
            builder.storeUint(0x05, 4);
            builder.store(storeSplitMergeInfo(src.splitInfo));
            builder.storeRef(
                beginCell().store(storeTransaction(src.prepareTransaction)),
            );
            builder.storeBit(src.installed);
        } else {
            throw Error(`Unsupported transaction description type ${src.type}`);
        }
    };
}
