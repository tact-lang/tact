/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Address } from "@/core/address/address";
import type { ExternalAddress } from "@/core/address/external-address";
import { BitBuilder } from "@/core/boc/bit-builder";
import type { BitString } from "@/core/boc/bit-string";
import type { Writable } from "@/core/boc/writable";
import { Cell } from "@/core/boc/cell";
import type { Slice } from "@/core/boc/slice";
import { writeString } from "@/core/boc/utils/strings";
import type {
    Dictionary,
    DictionaryKey,
    DictionaryKeyTypes,
    DictionaryValue,
} from "@/core/dict/dictionary";
import type { Maybe } from "@/core/utils/maybe";

/**
 * Start building a cell
 * @returns a new builder
 */
export function beginCell() {
    return new Builder();
}

/**
 * Builder for Cells
 */
export class Builder {
    private _bits: BitBuilder;
    private _refs: Cell[];

    constructor() {
        this._bits = new BitBuilder();
        this._refs = [];
    }

    /**
     * Bits written so far
     */
    get bits() {
        return this._bits.length;
    }

    /**
     * References written so far
     */
    get refs() {
        return this._refs.length;
    }

    /**
     * Available bits
     */
    get availableBits() {
        return 1023 - this.bits;
    }

    /**
     * Available references
     */
    get availableRefs() {
        return 4 - this.refs;
    }

    /**
     * Write a single bit
     * @param value bit to write, true or positive number for 1, false or zero or negative for 0
     * @returns this builder
     */
    storeBit(value: boolean | number) {
        this._bits.writeBit(value);
        return this;
    }

    /**
     * Write bits from BitString
     * @param src source bits
     * @returns this builder
     */
    storeBits(src: BitString) {
        this._bits.writeBits(src);
        return this;
    }

    /**
     * Store Buffer
     * @param src source buffer
     * @param bytes optional number of bytes to write
     * @returns this builder
     */
    storeBuffer(src: Buffer, bytes?: Maybe<number>) {
        if (bytes !== undefined && bytes !== null) {
            if (src.length !== bytes) {
                throw Error(
                    `Buffer length ${src.length} is not equal to ${bytes}`,
                );
            }
        }
        this._bits.writeBuffer(src);
        return this;
    }

    /**
     * Store Maybe Buffer
     * @param src source buffer or null
     * @param bytes optional number of bytes to write
     * @returns this builder
     */
    storeMaybeBuffer(src: Buffer | null, bytes?: Maybe<number>) {
        if (src !== null) {
            this.storeBit(1);
            this.storeBuffer(src, bytes);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store uint value
     * @param value value as bigint or number
     * @param bits number of bits to write
     * @returns this builder
     */
    storeUint(value: bigint | number, bits: number) {
        this._bits.writeUint(value, bits);
        return this;
    }

    /**
     * Store maybe uint value
     * @param value value as bigint or number, null or undefined
     * @param bits number of bits to write
     * @returns this builder
     */
    storeMaybeUint(value: Maybe<number | bigint>, bits: number) {
        if (value !== null && value !== undefined) {
            this.storeBit(1);
            this.storeUint(value, bits);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store int value
     * @param value value as bigint or number
     * @param bits number of bits to write
     * @returns this builder
     */
    storeInt(value: bigint | number, bits: number) {
        this._bits.writeInt(value, bits);
        return this;
    }

    /**
     * Store maybe int value
     * @param value value as bigint or number, null or undefined
     * @param bits number of bits to write
     * @returns this builder
     */
    storeMaybeInt(value: Maybe<number | bigint>, bits: number) {
        if (value !== null && value !== undefined) {
            this.storeBit(1);
            this.storeInt(value, bits);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store varuint value
     * @param value value as bigint or number
     * @param bits number of bits to write to header
     * @returns this builder
     */
    storeVarUint(value: number | bigint, bits: number) {
        this._bits.writeVarUint(value, bits);
        return this;
    }

    /**
     * Store maybe varuint value
     * @param value value as bigint or number, null or undefined
     * @param bits number of bits to write to header
     * @returns this builder
     */
    storeMaybeVarUint(value: Maybe<number | bigint>, bits: number) {
        if (value !== null && value !== undefined) {
            this.storeBit(1);
            this.storeVarUint(value, bits);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store varint value
     * @param value value as bigint or number
     * @param bits number of bits to write to header
     * @returns this builder
     */
    storeVarInt(value: number | bigint, bits: number) {
        this._bits.writeVarInt(value, bits);
        return this;
    }

    /**
     * Store maybe varint value
     * @param value value as bigint or number, null or undefined
     * @param bits number of bits to write to header
     * @returns this builder
     */
    storeMaybeVarInt(value: Maybe<number | bigint>, bits: number) {
        if (value !== null && value !== undefined) {
            this.storeBit(1);
            this.storeVarInt(value, bits);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store coins value
     * @param amount amount of coins
     * @returns this builder
     */
    storeCoins(amount: number | bigint) {
        this._bits.writeCoins(amount);
        return this;
    }

    /**
     * Store maybe coins value
     * @param amount amount of coins, null or undefined
     * @returns this builder
     */
    storeMaybeCoins(amount: Maybe<number | bigint>) {
        if (amount !== null && amount !== undefined) {
            this.storeBit(1);
            this.storeCoins(amount);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store address
     * @param addres address to store
     * @returns this builder
     */
    storeAddress(address: Maybe<Address | ExternalAddress>) {
        this._bits.writeAddress(address);
        return this;
    }

    /**
     * Store reference
     * @param cell cell or builder to store
     * @returns this builder
     */
    storeRef(cell: Cell | Builder) {
        // Check refs
        if (this._refs.length >= 4) {
            throw new Error("Too many references");
        }

        // Store reference
        if (cell instanceof Cell) {
            this._refs.push(cell);
        } else if (cell instanceof Builder) {
            this._refs.push(cell.endCell());
        } else {
            throw new Error("Invalid argument");
        }

        return this;
    }

    /**
     * Store reference if not null
     * @param cell cell or builder to store
     * @returns this builder
     */
    storeMaybeRef(cell?: Maybe<Cell | Builder>) {
        if (cell) {
            this.storeBit(1);
            this.storeRef(cell);
        } else {
            this.storeBit(0);
        }

        return this;
    }

    /**
     * Store slice it in this builder
     * @param src source slice
     */
    storeSlice(src: Slice) {
        const c = src.clone();
        if (c.remainingBits > 0) {
            this.storeBits(c.loadBits(c.remainingBits));
        }
        while (c.remainingRefs > 0) {
            this.storeRef(c.loadRef());
        }
        return this;
    }

    /**
     * Store slice in this builder if not null
     * @param src source slice
     */
    storeMaybeSlice(src?: Maybe<Slice>) {
        if (src) {
            this.storeBit(1);
            this.storeSlice(src);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store builder
     * @param src builder to store
     * @returns this builder
     */
    storeBuilder(src: Builder) {
        return this.storeSlice(src.endCell().beginParse());
    }

    /**
     * Store builder if not null
     * @param src builder to store
     * @returns this builder
     */
    storeMaybeBuilder(src?: Maybe<Builder>) {
        if (src) {
            this.storeBit(1);
            this.storeBuilder(src);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store writer or builder
     * @param writer writer or builder to store
     * @returns this builder
     */
    storeWritable(writer: ((builder: Builder) => void) | Writable) {
        if (typeof writer === "object") {
            writer.writeTo(this);
        } else {
            writer(this);
        }
        return this;
    }

    /**
     * Store writer or builder if not null
     * @param writer writer or builder to store
     * @returns this builder
     */
    storeMaybeWritable(
        writer?: Maybe<((builder: Builder) => void) | Writable>,
    ) {
        if (writer) {
            this.storeBit(1);
            this.storeWritable(writer);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store object in this builder
     * @param writer Writable or writer functuin
     */
    store(writer: ((builder: Builder) => void) | Writable) {
        this.storeWritable(writer);
        return this;
    }

    /**
     * Store string tail
     * @param src source string
     * @returns this builder
     */
    storeStringTail(src: string) {
        writeString(src, this);
        return this;
    }

    /**
     * Store string tail
     * @param src source string
     * @returns this builder
     */
    storeMaybeStringTail(src?: Maybe<string>) {
        if (src !== null && src !== undefined) {
            this.storeBit(1);
            writeString(src, this);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store string tail in ref
     * @param src source string
     * @returns this builder
     */
    storeStringRefTail(src: string) {
        this.storeRef(beginCell().storeStringTail(src));
        return this;
    }

    /**
     * Store maybe string tail in ref
     * @param src source string
     * @returns this builder
     */
    storeMaybeStringRefTail(src?: Maybe<string | null>) {
        if (src !== null && src !== undefined) {
            this.storeBit(1);
            this.storeStringRefTail(src);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store dictionary in this builder
     * @param dict dictionary to store
     * @returns this builder
     */
    storeDict<K extends DictionaryKeyTypes, V>(
        dict?: Maybe<Dictionary<K, V>>,
        key?: Maybe<DictionaryKey<K>>,
        value?: Maybe<DictionaryValue<V>>,
    ) {
        if (dict) {
            dict.store(this, key, value);
        } else {
            this.storeBit(0);
        }
        return this;
    }

    /**
     * Store dictionary in this builder directly
     * @param dict dictionary to store
     * @returns this builder
     */
    storeDictDirect<K extends DictionaryKeyTypes, V>(
        dict: Dictionary<K, V>,
        key?: Maybe<DictionaryKey<K>>,
        value?: Maybe<DictionaryValue<V>>,
    ) {
        dict.storeDirect(this, key, value);
        return this;
    }

    /**
     * Complete cell
     * @param opts options
     * @returns cell
     */
    endCell(opts?: { exotic?: boolean }) {
        return new Cell({
            bits: this._bits.build(),
            refs: this._refs,
            exotic: opts?.exotic,
        });
    }

    /**
     * Convert to cell
     * @returns cell
     */
    asCell() {
        return this.endCell();
    }

    /**
     * Convert to slice
     * @returns slice
     */
    asSlice() {
        return this.endCell().beginParse();
    }
}
