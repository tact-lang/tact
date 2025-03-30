/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import { beginCell } from "../boc/builder";
import type { Cell } from "../boc/cell";
import type { Slice } from "../boc/slice";
import { Dictionary } from "../dict/dictionary";
import type { Maybe } from "../utils/maybe";
import type { AccountStatus } from "./account-status";
import { loadAccountStatus, storeAccountStatus } from "./account-status";
import type { CurrencyCollection } from "./currency-collection";
import {
    loadCurrencyCollection,
    storeCurrencyCollection,
} from "./currency-collection";
import type { HashUpdate } from "./hash-update";
import { loadHashUpdate, storeHashUpdate } from "./hash-update";
import type { Message } from "./message";
import { loadMessage, MessageValue, storeMessage } from "./message";
import type { TransactionDescription } from "./transaction-description";
import {
    loadTransactionDescription,
    storeTransactionDescription,
} from "./transaction-description";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L263
// transaction$0111 account_addr:bits256 lt:uint64
//  prev_trans_hash:bits256 prev_trans_lt:uint64 now:uint32
//  outmsg_cnt:uint15
//  orig_status:AccountStatus end_status:AccountStatus
//  ^[ in_msg:(Maybe ^(Message Any)) out_msgs:(HashmapE 15 ^(Message Any)) ]
//  total_fees:CurrencyCollection state_update:^(HASH_UPDATE Account)
//  description:^TransactionDescr = Transaction;

export type Transaction = {
    address: bigint;
    lt: bigint;
    prevTransactionHash: bigint;
    prevTransactionLt: bigint;
    now: number;
    outMessagesCount: number;
    oldStatus: AccountStatus;
    endStatus: AccountStatus;
    inMessage?: Maybe<Message>;
    outMessages: Dictionary<number, Message>;
    totalFees: CurrencyCollection;
    stateUpdate: HashUpdate;
    description: TransactionDescription;
    raw: Cell;
    hash: () => Buffer;
};

export function loadTransaction(slice: Slice): Transaction {
    const raw = slice.asCell();

    if (slice.loadUint(4) !== 0x07) {
        throw Error("Invalid data");
    }

    const address = slice.loadUintBig(256);
    const lt = slice.loadUintBig(64);
    const prevTransactionHash = slice.loadUintBig(256);
    const prevTransactionLt = slice.loadUintBig(64);
    const now = slice.loadUint(32);
    const outMessagesCount = slice.loadUint(15);
    const oldStatus = loadAccountStatus(slice);
    const endStatus = loadAccountStatus(slice);

    const msgRef = slice.loadRef();
    const msgSlice = msgRef.beginParse();
    const inMessage = msgSlice.loadBit()
        ? loadMessage(msgSlice.loadRef().beginParse())
        : undefined;
    const outMessages = msgSlice.loadDict(
        Dictionary.Keys.Uint(15),
        MessageValue,
    );
    msgSlice.endParse();

    const totalFees = loadCurrencyCollection(slice);
    const stateUpdate = loadHashUpdate(slice.loadRef().beginParse());
    const description = loadTransactionDescription(
        slice.loadRef().beginParse(),
    );
    return {
        address,
        lt,
        prevTransactionHash,
        prevTransactionLt,
        now,
        outMessagesCount,
        oldStatus,
        endStatus,
        inMessage,
        outMessages,
        totalFees,
        stateUpdate,
        description,
        raw,
        hash: () => raw.hash(),
    };
}

export function storeTransaction(src: Transaction) {
    return (builder: Builder) => {
        builder.storeUint(0x07, 4);
        builder.storeUint(src.address, 256);
        builder.storeUint(src.lt, 64);
        builder.storeUint(src.prevTransactionHash, 256);
        builder.storeUint(src.prevTransactionLt, 64);
        builder.storeUint(src.now, 32);
        builder.storeUint(src.outMessagesCount, 15);
        builder.store(storeAccountStatus(src.oldStatus));
        builder.store(storeAccountStatus(src.endStatus));

        const msgBuilder = beginCell();
        if (src.inMessage) {
            msgBuilder.storeBit(true);
            msgBuilder.storeRef(beginCell().store(storeMessage(src.inMessage)));
        } else {
            msgBuilder.storeBit(false);
        }
        msgBuilder.storeDict(src.outMessages);
        builder.storeRef(msgBuilder);

        builder.store(storeCurrencyCollection(src.totalFees));
        builder.storeRef(beginCell().store(storeHashUpdate(src.stateUpdate)));
        builder.storeRef(
            beginCell().store(storeTransactionDescription(src.description)),
        );
    };
}
