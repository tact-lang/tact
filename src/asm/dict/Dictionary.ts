/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import {Address} from "@ton/core"
import {beginCell} from "@ton/core"
import {Slice, Cell} from "@ton/core"
import {BitString} from "@ton/core"
import {serializeDict} from "./serializeDict"
import {Maybe} from "@ton/core/src/utils/maybe"
import {CodeBuilder} from "../runtime/builder"
import {parseDict} from "./parseDict"
import {deserializeInternalKey, serializeInternalKey} from "./internalKeySerializer"

export type DictionaryKeyTypes = Address | number | bigint | Buffer | BitString

export type DictionaryKey<K extends DictionaryKeyTypes> = {
    bits: number
    serialize(src: K): bigint
    parse(src: bigint): K
}

export type DictionaryValue<V> = {
    serialize(src: V, builder: CodeBuilder): void
    parse(src: Slice): V
}

export class Dictionary<K extends DictionaryKeyTypes, V> {
    static Keys = {
        /**
         * Create integer key
         * @param bits bits of integer
         * @returns DictionaryKey<number>
         */
        Int: (bits: number) => {
            return createIntKey(bits)
        },
    }

    /**
     * Create an empty map
     * @param key key type
     * @param value value type
     * @returns Dictionary<K, V>
     */
    static empty<K extends DictionaryKeyTypes, V>(
        key?: Maybe<DictionaryKey<K>>,
        value?: Maybe<DictionaryValue<V>>,
    ): Dictionary<K, V> {
        if (key && value) {
            return new Dictionary<K, V>(new Map(), key, value)
        } else {
            return new Dictionary<K, V>(new Map(), null, null)
        }
    }

    private readonly _key: DictionaryKey<K> | null
    private readonly _value: DictionaryValue<V> | null
    private readonly _map: Map<string, V>

    private constructor(
        values: Map<string, V>,
        key: DictionaryKey<K> | null,
        value: DictionaryValue<V> | null,
    ) {
        this._key = key
        this._value = value
        this._map = values
    }

    set(key: K, value: V): this {
        this._map.set(serializeInternalKey(key), value)
        return this
    }

    *[Symbol.iterator](): IterableIterator<[K, V]> {
        for (const [k, v] of this._map) {
            const key = deserializeInternalKey(k) as K
            yield [key, v]
        }
    }

    /**
     * Low level method for rare dictionaries from system contracts.
     * Loads dictionary from slice directly without going to the ref.
     *
     * @param key key description
     * @param value value description
     * @param sc slice
     * @returns Dictionary<K, V>
     */
    static loadDirect<K extends DictionaryKeyTypes, V>(
        key: DictionaryKey<K>,
        value: DictionaryValue<V>,
        sc: Slice | Cell | null,
    ): Dictionary<K, V> {
        if (!sc) {
            return Dictionary.empty<K, V>(key, value)
        }
        const slice = sc instanceof Cell ? sc.beginParse() : sc

        const values = parseDict(slice, key.bits, value.parse)
        const prepare = new Map<string, V>()
        for (let [k, v] of values) {
            prepare.set(serializeInternalKey(key.parse(k)), v)
        }

        return new Dictionary(prepare, key, value)
    }

    storeDirect(builder: CodeBuilder) {
        if (this._map.size === 0) {
            throw Error("Cannot store empty dictionary directly")
        }

        const resolvedKey = this._key
        const resolvedValue = this._value
        if (!resolvedKey) {
            throw Error("Key serializer is not defined")
        }
        if (!resolvedValue) {
            throw Error("Value serializer is not defined")
        }

        let prepared = new Map<bigint, V>()
        for (const [k, v] of this._map) {
            prepared.set(resolvedKey.serialize(deserializeInternalKey(k)), v)
        }

        serializeDict(prepared, resolvedKey.bits, resolvedValue.serialize, builder)
    }
}

function createIntKey(bits: number): DictionaryKey<number> {
    return {
        bits: bits,
        serialize: src => {
            if (!Number.isSafeInteger(src)) {
                throw Error("Key is not a safe integer: " + src)
            }
            return beginCell().storeInt(src, bits).endCell().beginParse().loadUintBig(bits)
        },
        parse: src => {
            return beginCell().storeUint(src, bits).endCell().beginParse().loadInt(bits)
        },
    }
}
