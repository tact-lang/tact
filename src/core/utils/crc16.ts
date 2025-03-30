/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

export function crc16(data: Buffer) {
    const poly = 0x1021;
    let reg = 0;
    const message = Buffer.alloc(data.length + 2);
    message.set(data);
    for (const byte of message) {
        let mask = 0x80;
        while (mask > 0) {
            reg <<= 1;
            if (byte & mask) {
                reg += 1;
            }
            mask >>= 1;
            if (reg > 0xffff) {
                reg &= 0xffff;
                reg ^= poly;
            }
        }
    }
    return Buffer.from([Math.floor(reg / 256), reg % 256]);
}
