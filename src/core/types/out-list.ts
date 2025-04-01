/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { SendMode } from "@/core/types/send-mode";
import type { MessageRelaxed } from "@/core/types/message-relaxed";
import { loadMessageRelaxed, storeMessageRelaxed } from "@/core/types/message-relaxed";
import type { Builder } from "@/core/boc/builder";
import { beginCell } from "@/core/boc/builder";
import type { Cell } from "@/core/boc/cell";
import type { Slice } from "@/core/boc/slice";
import { loadStorageInfo, storeStorageInfo } from "@/core/types/storage-into";
import { loadAccountStorage, storeAccountStorage } from "@/core/types/account-storage";
import { Account } from "@/core/types/account";
import { loadMessage } from "@/core/types/message";
import type { CurrencyCollection } from "@/core/types/currency-collection";
import {
    loadCurrencyCollection,
    storeCurrencyCollection,
} from "@/core/types/currency-collection";
import { SimpleLibrary } from "@/core/types/simple-library";
import type { LibRef } from "@/core/types/lib-ref";
import { loadLibRef, storeLibRef } from "@/core/types/lib-ref";
import type { ReserveMode } from "@/core/types/reserve-mode";

export interface OutActionSendMsg {
    type: "sendMsg";
    mode: SendMode;
    outMsg: MessageRelaxed;
}

export interface OutActionSetCode {
    type: "setCode";
    newCode: Cell;
}

export interface OutActionReserve {
    type: "reserve";
    mode: ReserveMode;
    currency: CurrencyCollection;
}

export interface OutActionChangeLibrary {
    type: "changeLibrary";
    mode: number;
    libRef: LibRef;
}

export type OutAction =
    | OutActionSendMsg
    | OutActionSetCode
    | OutActionReserve
    | OutActionChangeLibrary;

export function storeOutAction(action: OutAction) {
    switch (action.type) {
        case "sendMsg":
            return storeOutActionSendMsg(action);
        case "setCode":
            return storeOutActionSetCode(action);
        case "reserve":
            return storeOutActionReserve(action);
        case "changeLibrary":
            return storeOutActionChangeLibrary(action);
        default:
            throw new Error(
                `Unknown action type ${(action as OutAction).type}`,
            );
    }
}

/*
action_send_msg#0ec3c86d mode:(## 8)
  out_msg:^(MessageRelaxed Any) = OutAction;
*/
const outActionSendMsgTag = 0x0ec3c86d;
function storeOutActionSendMsg(action: OutActionSendMsg) {
    return (builder: Builder) => {
        builder
            .storeUint(outActionSendMsgTag, 32)
            .storeUint(action.mode, 8)
            .storeRef(
                beginCell().store(storeMessageRelaxed(action.outMsg)).endCell(),
            );
    };
}

/*
action_set_code#ad4de08e new_code:^Cell = OutAction;
 */
const outActionSetCodeTag = 0xad4de08e;
function storeOutActionSetCode(action: OutActionSetCode) {
    return (builder: Builder) => {
        builder.storeUint(outActionSetCodeTag, 32).storeRef(action.newCode);
    };
}

/*
action_reserve_currency#36e6b809 mode:(## 8)
  currency:CurrencyCollection = OutAction;
 */
const outActionReserveTag = 0x36e6b809;
function storeOutActionReserve(action: OutActionReserve) {
    return (builder: Builder) => {
        builder
            .storeUint(outActionReserveTag, 32)
            .storeUint(action.mode, 8)
            .store(storeCurrencyCollection(action.currency));
    };
}

/*
action_change_library#26fa1dd4 mode:(## 7)
  libref:LibRef = OutAction;
 */
const outActionChangeLibraryTag = 0x26fa1dd4;
function storeOutActionChangeLibrary(action: OutActionChangeLibrary) {
    return (builder: Builder) => {
        builder
            .storeUint(outActionChangeLibraryTag, 32)
            .storeUint(action.mode, 7)
            .store(storeLibRef(action.libRef));
    };
}

export function loadOutAction(slice: Slice): OutAction {
    const tag = slice.loadUint(32);
    if (tag === outActionSendMsgTag) {
        const mode = slice.loadUint(8);
        const outMsg = loadMessageRelaxed(slice.loadRef().beginParse());

        return {
            type: "sendMsg",
            mode,
            outMsg,
        };
    }

    if (tag === outActionSetCodeTag) {
        const newCode = slice.loadRef();

        return {
            type: "setCode",
            newCode,
        };
    }

    if (tag === outActionReserveTag) {
        const mode = slice.loadUint(8);
        const currency = loadCurrencyCollection(slice);

        return {
            type: "reserve",
            mode,
            currency,
        };
    }

    if (tag === outActionChangeLibraryTag) {
        const mode = slice.loadUint(7);
        const libRef = loadLibRef(slice);

        return {
            type: "changeLibrary",
            mode,
            libRef,
        };
    }

    throw new Error(`Unknown out action tag 0x${tag.toString(16)}`);
}

/*
out_list_empty$_ = OutList 0;
out_list$_ {n:#} prev:^(OutList n) action:OutAction
  = OutList (n + 1);
 */
export function storeOutList(actions: OutAction[]) {
    const cell = actions.reduce(
        (cell, action) =>
            beginCell().storeRef(cell).store(storeOutAction(action)).endCell(),
        beginCell().endCell(),
    );

    return (builder: Builder) => {
        builder.storeSlice(cell.beginParse());
    };
}

export function loadOutList(slice: Slice): OutAction[] {
    const actions: OutAction[] = [];
    while (slice.remainingRefs) {
        const nextCell = slice.loadRef();

        actions.push(loadOutAction(slice));
        slice = nextCell.beginParse();
    }

    return actions.reverse();
}
