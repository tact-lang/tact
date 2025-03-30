/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { BitBuilder } from "../bit-builder";
import { BitString } from "../bit-string";

export function bitsToPaddedBuffer(bits: BitString) {
    // Create builder
    const builder = new BitBuilder(Math.ceil(bits.length / 8) * 8);
    builder.writeBits(bits);

    // Apply padding
    const padding = Math.ceil(bits.length / 8) * 8 - bits.length;
    for (let i = 0; i < padding; i++) {
        if (i === 0) {
            builder.writeBit(1);
        } else {
            builder.writeBit(0);
        }
    }

    return builder.buffer();
}
export function paddedBufferToBits(buff: Buffer) {
    let bitLen = 0;
    // Finding rightmost non-zero byte in the buffer
    for (let i = buff.length - 1; i >= 0; i--) {
        if (buff[i] !== 0) {
            const testByte = buff[i];
            if (typeof testByte === 'undefined') {
                throw new Error("Impossible");
            }
            // Looking for a rightmost set padding bit
            let bitPos = testByte & -testByte;
            if ((bitPos & 1) == 0) {
                // It's power of 2 (only one bit set)
                bitPos = Math.log2(bitPos) + 1;
            }
            if (i > 0) {
                // If we are dealing with more than 1 byte buffer
                bitLen = i << 3; //Number of full bytes * 8
            }
            bitLen += 8 - bitPos;
            break;
        }
    }
    return new BitString(buff, 0, bitLen);
}
