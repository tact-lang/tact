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
import type { Maybe } from "../utils/maybe";
import type { CommonMessageInfoRelaxed } from "./common-message-info-relaxed";
import {
    loadCommonMessageInfoRelaxed,
    storeCommonMessageInfoRelaxed,
} from "./common-message-info-relaxed";
import type { StateInit } from "./state-init";
import { loadStateInit, storeStateInit } from "./state-init";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L151
// message$_ {X:Type} info:CommonMsgInfoRelaxed
//  init:(Maybe (Either StateInit ^StateInit))
//  body:(Either X ^X) = MessageRelaxed X;

export type MessageRelaxed = {
    info: CommonMessageInfoRelaxed;
    init?: Maybe<StateInit>;
    body: Cell;
};

export function loadMessageRelaxed(slice: Slice): MessageRelaxed {
    const info = loadCommonMessageInfoRelaxed(slice);
    let init: StateInit | null = null;
    if (slice.loadBit()) {
        if (!slice.loadBit()) {
            init = loadStateInit(slice);
        } else {
            init = loadStateInit(slice.loadRef().beginParse());
        }
    }
    const body = slice.loadBit() ? slice.loadRef() : slice.asCell();

    return {
        info,
        init,
        body,
    };
}

export function storeMessageRelaxed(
    message: MessageRelaxed,
    opts?: { forceRef?: boolean },
) {
    return (builder: Builder) => {
        // Store CommonMsgInfo
        builder.store(storeCommonMessageInfoRelaxed(message.info));

        // Store init
        if (message.init) {
            builder.storeBit(true);
            const initCell = beginCell().store(storeStateInit(message.init));

            // Check if ref is needed
            let needRef = false;
            if (opts?.forceRef) {
                needRef = true;
            } else {
                if (
                    builder.availableBits -
                        2 /* At least on byte for ref flag */ >=
                    initCell.bits
                ) {
                    needRef = false;
                } else {
                    needRef = true;
                }
            }

            // Store ref
            if (needRef) {
                builder.storeBit(true);
                builder.storeRef(initCell);
            } else {
                builder.storeBit(false);
                builder.storeBuilder(initCell);
            }
        } else {
            builder.storeBit(false);
        }

        // Store body
        let needRef = false;
        if (opts?.forceRef) {
            needRef = true;
        } else {
            /* 
             1. If at least one bit for ref flag
             2. If enough space for refs
             3. If not exotic
            */

            if (
                builder.availableBits - 1 >= message.body.bits.length &&
                builder.refs + message.body.refs.length <= 4 &&
                !message.body.isExotic
            ) {
                needRef = false;
            } else {
                needRef = true;
            }
        }
        if (needRef) {
            builder.storeBit(true);
            builder.storeRef(message.body);
        } else {
            builder.storeBit(false);
            builder.storeBuilder(message.body.asBuilder());
        }
    };
}
