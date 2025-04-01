/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import inspectSymbol from "symbol.inspect";
import type {
    DictionaryKey,
    DictionaryKeyTypes,
    DictionaryValue,
} from "@/core/dict/dictionary";
import { Dictionary } from "@/core/dict/dictionary";
import type { BitReader } from "@/core/boc/bit-reader";
import { beginCell } from "@/core/boc/builder";
import type { Cell } from "@/core/boc/cell";
import { readString } from "@/core/boc/utils/strings";

/**
 * Slice is a class that allows to read cell data
 */
export class Slice {
    private _reader: BitReader;
    private _refs: Cell[];
    private _refsOffset: number;

    constructor(reader: BitReader, refs: Cell[]) {
        this._reader = reader.clone();
        this._refs = [...refs];
        this._refsOffset = 0;
    }

    /**
     * Get remaining bits
     */
    get remainingBits() {
        return this._reader.remaining;
    }

    /**
     * Get offset bits
     */
    get offsetBits() {
        return this._reader.offset;
    }

    /**
     * Get remaining refs
     */
    get remainingRefs() {
        return this._refs.length - this._refsOffset;
    }

    /**
     * Get offset refs
     */
    get offsetRefs() {
        return this._refsOffset;
    }

    /**
     * Skip bits
     * @param bits
     */
    skip(bits: number) {
        this._reader.skip(bits);
        return this;
    }

    /**
     * Load a single bit
     * @returns true or false depending on the bit value
     */
    loadBit() {
        return this._reader.loadBit();
    }

    /**
     * Preload a signle bit
     * @returns true or false depending on the bit value
     */
    preloadBit() {
        return this._reader.preloadBit();
    }

    /**
     * Load a boolean
     * @returns true or false depending on the bit value
     */
    loadBoolean() {
        return this.loadBit();
    }

    /**
     * Load maybe boolean
     * @returns true or false depending on the bit value or null
     */
    loadMaybeBoolean() {
        if (this.loadBit()) {
            return this.loadBoolean();
        } else {
            return null;
        }
    }

    /**
     * Load bits as a new BitString
     * @param bits number of bits to read
     * @returns new BitString
     */
    loadBits(bits: number) {
        return this._reader.loadBits(bits);
    }

    /**
     * Preload bits as a new BitString
     * @param bits number of bits to read
     * @returns new BitString
     */
    preloadBits(bits: number) {
        return this._reader.preloadBits(bits);
    }

    /**
     * Load uint
     * @param bits number of bits to read
     * @returns uint value
     */
    loadUint(bits: number) {
        return this._reader.loadUint(bits);
    }

    /**
     * Load uint
     * @param bits number of bits to read
     * @returns uint value
     */
    loadUintBig(bits: number) {
        return this._reader.loadUintBig(bits);
    }

    /**
     * Preload uint
     * @param bits number of bits to read
     * @returns uint value
     */
    preloadUint(bits: number) {
        return this._reader.preloadUint(bits);
    }

    /**
     * Preload uint
     * @param bits number of bits to read
     * @returns uint value
     */
    preloadUintBig(bits: number) {
        return this._reader.preloadUintBig(bits);
    }

    /**
     * Load maybe uint
     * @param bits number of bits to read
     * @returns uint value or null
     */
    loadMaybeUint(bits: number) {
        if (this.loadBit()) {
            return this.loadUint(bits);
        } else {
            return null;
        }
    }

    /**
     * Load maybe uint
     * @param bits number of bits to read
     * @returns uint value or null
     */
    loadMaybeUintBig(bits: number) {
        if (this.loadBit()) {
            return this.loadUintBig(bits);
        } else {
            return null;
        }
    }

    /**
     * Load int
     * @param bits number of bits to read
     * @returns int value
     */
    loadInt(bits: number) {
        return this._reader.loadInt(bits);
    }

    /**
     * Load int
     * @param bits number of bits to read
     * @returns int value
     */
    loadIntBig(bits: number) {
        return this._reader.loadIntBig(bits);
    }

    /**
     * Preload int
     * @param bits number of bits to read
     * @returns int value
     */
    preloadInt(bits: number) {
        return this._reader.preloadInt(bits);
    }

    /**
     * Preload int
     * @param bits number of bits to read
     * @returns int value
     */
    preloadIntBig(bits: number) {
        return this._reader.preloadIntBig(bits);
    }

    /**
     * Load maybe uint
     * @param bits number of bits to read
     * @returns uint value or null
     */
    loadMaybeInt(bits: number) {
        if (this.loadBit()) {
            return this.loadInt(bits);
        } else {
            return null;
        }
    }

    /**
     * Load maybe uint
     * @param bits number of bits to read
     * @returns uint value or null
     */
    loadMaybeIntBig(bits: number) {
        if (this.loadBit()) {
            return this.loadIntBig(bits);
        } else {
            return null;
        }
    }

    /**
     * Load varuint
     * @param bits number of bits to read in header
     * @returns varuint value
     */
    loadVarUint(bits: number) {
        return this._reader.loadVarUint(bits);
    }

    /**
     * Load varuint
     * @param bits number of bits to read in header
     * @returns varuint value
     */
    loadVarUintBig(bits: number) {
        return this._reader.loadVarUintBig(bits);
    }

    /**
     * Preload varuint
     * @param bits number of bits to read in header
     * @returns varuint value
     */
    preloadVarUint(bits: number) {
        return this._reader.preloadVarUint(bits);
    }

    /**
     * Preload varuint
     * @param bits number of bits to read in header
     * @returns varuint value
     */
    preloadVarUintBig(bits: number) {
        return this._reader.preloadVarUintBig(bits);
    }

    /**
     * Load varint
     * @param bits number of bits to read in header
     * @returns varint value
     */
    loadVarInt(bits: number) {
        return this._reader.loadVarInt(bits);
    }

    /**
     * Load varint
     * @param bits number of bits to read in header
     * @returns varint value
     */
    loadVarIntBig(bits: number) {
        return this._reader.loadVarIntBig(bits);
    }

    /**
     * Preload varint
     * @param bits number of bits to read in header
     * @returns varint value
     */
    preloadVarInt(bits: number) {
        return this._reader.preloadVarInt(bits);
    }

    /**
     * Preload varint
     * @param bits number of bits to read in header
     * @returns varint value
     */
    preloadVarIntBig(bits: number) {
        return this._reader.preloadVarIntBig(bits);
    }

    /**
     * Load coins
     * @returns coins value
     */
    loadCoins() {
        return this._reader.loadCoins();
    }

    /**
     * Preload coins
     * @returns coins value
     */
    preloadCoins() {
        return this._reader.preloadCoins();
    }

    /**
     * Load maybe coins
     * @returns coins value or null
     */
    loadMaybeCoins() {
        if (this._reader.loadBit()) {
            return this._reader.loadCoins();
        } else {
            return null;
        }
    }

    /**
     * Load internal Address
     * @returns Address
     */
    loadAddress() {
        return this._reader.loadAddress();
    }

    /**
     * Load optional internal Address
     * @returns Address or null
     */
    loadMaybeAddress() {
        return this._reader.loadMaybeAddress();
    }

    /**
     * Load external address
     * @returns ExternalAddress
     */
    loadExternalAddress() {
        return this._reader.loadExternalAddress();
    }

    /**
     * Load optional external address
     * @returns ExternalAddress or null
     */
    loadMaybeExternalAddress() {
        return this._reader.loadMaybeExternalAddress();
    }

    /**
     * Load address
     * @returns Address, ExternalAddress or null
     */
    loadAddressAny() {
        return this._reader.loadAddressAny();
    }

    /**
     * Load reference
     * @returns Cell
     */
    loadRef() {
        const ref = this._refs[this._refsOffset++];
        if (typeof ref === 'undefined') {
            throw new Error("No more references");
        }
        return ref;
    }

    /**
     * Preload reference
     * @returns Cell
     */
    preloadRef() {
        const ref = this._refs[this._refsOffset];
        if (typeof ref === 'undefined') {
            throw new Error("No more references");
        }
        return ref;
    }

    /**
     * Load optional reference
     * @returns Cell or null
     */
    loadMaybeRef() {
        if (this.loadBit()) {
            return this.loadRef();
        } else {
            return null;
        }
    }

    /**
     * Preload optional reference
     * @returns Cell or null
     */
    preloadMaybeRef() {
        if (this.preloadBit()) {
            return this.preloadRef();
        } else {
            return null;
        }
    }

    /**
     * Load byte buffer
     * @param bytes number of bytes to load
     * @returns Buffer
     */
    loadBuffer(bytes: number) {
        return this._reader.loadBuffer(bytes);
    }

    /**
     * Load byte buffer
     * @param bytes number of bytes to load
     * @returns Buffer
     */
    preloadBuffer(bytes: number) {
        return this._reader.preloadBuffer(bytes);
    }

    /**
     * Load string tail
     */
    loadStringTail() {
        return readString(this);
    }

    /**
     * Load maybe string tail
     * @returns string or null
     */
    loadMaybeStringTail() {
        if (this.loadBit()) {
            return readString(this);
        } else {
            return null;
        }
    }

    /**
     * Load string tail from ref
     * @returns string
     */
    loadStringRefTail() {
        return readString(this.loadRef().beginParse());
    }

    /**
     * Load maybe string tail from ref
     * @returns string or null
     */
    loadMaybeStringRefTail() {
        const ref = this.loadMaybeRef();
        if (ref) {
            return readString(ref.beginParse());
        } else {
            return null;
        }
    }

    /**
     * Loads dictionary
     * @param key key description
     * @param value value description
     * @returns Dictionary<K, V>
     */
    loadDict<K extends DictionaryKeyTypes, V>(
        key: DictionaryKey<K>,
        value: DictionaryValue<V>,
    ): Dictionary<K, V> {
        return Dictionary.load(key, value, this);
    }

    /**
     * Loads dictionary directly from current slice
     * @param key key description
     * @param value value description
     * @returns Dictionary<K, V>
     */
    loadDictDirect<K extends DictionaryKeyTypes, V>(
        key: DictionaryKey<K>,
        value: DictionaryValue<V>,
    ): Dictionary<K, V> {
        return Dictionary.loadDirect(key, value, this);
    }

    /**
     * Checks if slice is empty
     */
    endParse() {
        if (this.remainingBits > 0 || this.remainingRefs > 0) {
            throw new Error("Slice is not empty");
        }
    }

    /**
     * Convert slice to cell
     */
    asCell() {
        return beginCell().storeSlice(this).endCell();
    }

    /**
     *
     * @returns
     */
    asBuilder() {
        return beginCell().storeSlice(this);
    }

    /**
     * Clone slice
     * @returns cloned slice
     */
    clone(fromStart: boolean = false): Slice {
        if (fromStart) {
            const reader = this._reader.clone();
            reader.reset();
            return new Slice(reader, this._refs);
        } else {
            const res = new Slice(this._reader, this._refs);
            res._refsOffset = this._refsOffset;
            return res;
        }
    }

    /**
     * Print slice as string by converting it to cell
     * @returns string
     */
    toString(): string {
        return this.asCell().toString();
    }

    [inspectSymbol] = () => this.toString();
}
