/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import { beginCell } from "@/core/boc/builder";
import type { Cell } from "@/core/boc/cell";
import type { Slice } from "@/core/boc/slice";
import type { DictionaryValue } from "@/core/dict/dictionary";
import type { Maybe } from "@/core/utils/maybe";
import type { CommonMessageInfo } from "@/core/types/common-message-info";
import {
    loadCommonMessageInfo,
    storeCommonMessageInfo,
} from "@/core/types/common-message-info";
import type { StateInit } from "@/core/types/state-init";
import { loadStateInit, storeStateInit } from "@/core/types/state-init";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L147
// message$_ {X:Type} info:CommonMsgInfo
//  init:(Maybe (Either StateInit ^StateInit))
//  body:(Either X ^X) = Message X;

export type Message = {
    info: CommonMessageInfo;
    init?: Maybe<StateInit>;
    body: Cell;
};

export function loadMessage(slice: Slice): Message {
    const info = loadCommonMessageInfo(slice);
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

export function storeMessage(message: Message, opts?: { forceRef?: boolean }) {
    return (builder: Builder) => {
        // Store CommonMsgInfo
        builder.store(storeCommonMessageInfo(message.info));

        // Store init
        if (message.init) {
            builder.storeBit(true);
            const initCell = beginCell().store(storeStateInit(message.init));

            // Check if need to store it in ref
            let needRef = false;
            if (opts?.forceRef) {
                needRef = true;
            } else {
                needRef =
                    builder.availableBits -
                        2 /* At least two bits for ref flags */ <
                    initCell.bits + message.body.bits.length;
            }

            // Persist init
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
            needRef =
                builder.availableBits - 1 /* At least one bit for ref flag */ <
                    message.body.bits.length ||
                builder.refs + message.body.refs.length > 4;
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

export const MessageValue: DictionaryValue<Message> = {
    serialize(src, builder) {
        builder.storeRef(beginCell().store(storeMessage(src)));
    },
    parse(slice) {
        return loadMessage(slice.loadRef().beginParse());
    },
};
