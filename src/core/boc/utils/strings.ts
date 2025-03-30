/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../builder";
import { beginCell } from "../builder";
import type { Cell } from "../cell";
import type { Slice } from "../slice";

function readBuffer(slice: Slice) {
    // Check consistency
    if (slice.remainingBits % 8 !== 0) {
        throw new Error(`Invalid string length: ${slice.remainingBits}`);
    }
    if (slice.remainingRefs !== 0 && slice.remainingRefs !== 1) {
        throw new Error(`invalid number of refs: ${slice.remainingRefs}`);
    }

    // Read string
    let res: Buffer;
    if (slice.remainingBits === 0) {
        res = Buffer.alloc(0);
    } else {
        res = slice.loadBuffer(slice.remainingBits / 8);
    }

    // Read tail
    if (slice.remainingRefs === 1) {
        res = Buffer.concat([res, readBuffer(slice.loadRef().beginParse())]);
    }

    return res;
}

export function readString(slice: Slice) {
    return readBuffer(slice).toString();
}

function writeBuffer(src: Buffer, builder: Builder) {
    if (src.length > 0) {
        const bytes = Math.floor(builder.availableBits / 8);
        if (src.length > bytes) {
            const a = src.subarray(0, bytes);
            const t = src.subarray(bytes);
            builder = builder.storeBuffer(a);
            const bb = beginCell();
            writeBuffer(t, bb);
            builder = builder.storeRef(bb.endCell());
        } else {
            builder = builder.storeBuffer(src);
        }
    }
}

export function stringToCell(src: string): Cell {
    const builder = beginCell();
    writeBuffer(Buffer.from(src), builder);
    return builder.endCell();
}

export function writeString(src: string, builder: Builder) {
    writeBuffer(Buffer.from(src), builder);
}
