/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

const alphabet = "abcdefghijklmnopqrstuvwxyz234567";

export function base32Encode(buffer: Buffer): string {
    const length = buffer.byteLength;
    let bits = 0;
    let value = 0;
    let output = "";

    for (let i = 0; i < length; i++) {
        value = (value << 8) | buffer[i]!;
        bits += 8;

        while (bits >= 5) {
            output += alphabet[(value >>> (bits - 5)) & 31];
            bits -= 5;
        }
    }
    if (bits > 0) {
        output += alphabet[(value << (5 - bits)) & 31];
    }
    return output;
}

function readChar(alphabet: string, char: string): number {
    const idx = alphabet.indexOf(char);

    if (idx === -1) {
        throw new Error("Invalid character found: " + char);
    }

    return idx;
}

export function base32Decode(input: string): Buffer {
    let cleanedInput: string;
    cleanedInput = input.toLowerCase();

    const { length } = cleanedInput;

    let bits = 0;
    let value = 0;

    let index = 0;
    const output = Buffer.alloc(((length * 5) / 8) | 0);

    for (let i = 0; i < length; i++) {
        value = (value << 5) | readChar(alphabet, cleanedInput[i]!);
        bits += 5;

        if (bits >= 8) {
            output[index++] = (value >>> (bits - 8)) & 255;
            bits -= 8;
        }
    }

    return output;
}
