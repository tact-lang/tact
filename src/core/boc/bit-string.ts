/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { bitsToPaddedBuffer } from "@/core/boc/utils/padded-bits";
import inspectSymbol from "symbol.inspect";

/**
 * BitString is a class that represents a bitstring in a buffer with a specified offset and length
 */
export class BitString {
    static readonly EMPTY = new BitString(Buffer.alloc(0), 0, 0);

    // NOTE: We want to hide this fields from the user, but
    //       using private fields would break the compatibility
    //       between different versions in typescript

    private readonly _offset: number;
    private readonly _length: number;
    private readonly _data: Buffer;

    /**
     * Checks if supplied object is BitString
     * @param src is unknow object
     * @returns true if object is BitString and false otherwise
     **/
    static isBitString(src: unknown): src is BitString {
        return src instanceof BitString;
    }
    /**
     * Constructing BitString from a buffer
     * @param data data that contains the bitstring data. NOTE: We are expecting this buffer to be NOT modified
     * @param offset offset in bits from the start of the buffer
     * @param length length of the bitstring in bits
     */
    constructor(data: Buffer, offset: number, length: number) {
        // Check bounds
        if (length < 0) {
            throw new Error(`Length ${length} is out of bounds`);
        }

        this._length = length;
        this._data = data;
        this._offset = offset;
    }

    /**
     * Returns the length of the bitstring
     */
    get length() {
        return this._length;
    }

    /**
     * Returns the bit at the specified index
     * @param index index of the bit
     * @throws Error if index is out of bounds
     * @returns true if the bit is set, false otherwise
     */
    at(index: number) {
        // Check bounds
        if (index >= this._length) {
            throw new Error(
                `Index ${index} > ${this._length} is out of bounds`,
            );
        }
        if (index < 0) {
            throw new Error(`Index ${index} < 0 is out of bounds`);
        }

        // Calculcate offsets
        const byteIndex = (this._offset + index) >> 3;
        const bitIndex = 7 - ((this._offset + index) % 8); // NOTE: We are using big endian

        // Return the bit
        // @ts-ignore
        return (this._data[byteIndex] & (1 << bitIndex)) !== 0;
    }

    /**
     * Get a substring of the bitstring
     * @param offset
     * @param length
     * @returns
     */
    substring(offset: number, length: number) {
        // Check offset
        if (offset > this._length) {
            throw new Error(
                `Offset(${offset}) > ${this._length} is out of bounds`,
            );
        }
        if (offset < 0) {
            throw new Error(`Offset(${offset}) < 0 is out of bounds`);
        }

        // Corner case of empty string
        if (length === 0) {
            return BitString.EMPTY;
        }

        if (offset + length > this._length) {
            throw new Error(
                `Offset ${offset} + Length ${length} > ${this._length} is out of bounds`,
            );
        }

        // Create substring
        return new BitString(this._data, this._offset + offset, length);
    }

    /**
     * Try to get a buffer from the bitstring without allocations
     * @param offset offset in bits
     * @param length length in bits
     * @returns buffer if the bitstring is aligned to bytes, null otherwise
     */
    subbuffer(offset: number, length: number) {
        // Check offset
        if (offset > this._length) {
            throw new Error(`Offset ${offset} is out of bounds`);
        }
        if (offset < 0) {
            throw new Error(`Offset ${offset} is out of bounds`);
        }
        if (offset + length > this._length) {
            throw new Error(
                `Offset + Lenght = ${offset + length} is out of bounds`,
            );
        }

        // Check alignment
        if (length % 8 !== 0) {
            return null;
        }
        if ((this._offset + offset) % 8 !== 0) {
            return null;
        }

        // Create substring
        const start = (this._offset + offset) >> 3;
        const end = start + (length >> 3);
        return this._data.subarray(start, end);
    }

    /**
     * Checks for equality
     * @param b other bitstring
     * @returns true if the bitstrings are equal, false otherwise
     */
    equals(b: BitString) {
        if (this._length !== b._length) {
            return false;
        }
        for (let i = 0; i < this._length; i++) {
            if (this.at(i) !== b.at(i)) {
                return false;
            }
        }
        return true;
    }

    /**
     * Format to canonical string
     * @returns formatted bits as a string
     */
    toString(): string {
        const padded = bitsToPaddedBuffer(this);

        if (this._length % 4 === 0) {
            const s = padded
                .subarray(0, Math.ceil(this._length / 8))
                .toString("hex")
                .toUpperCase();
            if (this._length % 8 === 0) {
                return s;
            } else {
                return s.substring(0, s.length - 1);
            }
        } else {
            const hex = padded.toString("hex").toUpperCase();
            if (this._length % 8 <= 4) {
                return hex.substring(0, hex.length - 1) + "_";
            } else {
                return hex + "_";
            }
        }
    }
    [inspectSymbol] = () => this.toString();
}
