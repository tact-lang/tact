/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import {Slice} from "@ton/core"

function readUnaryLength(slice: Slice) {
    let res = 0
    while (slice.loadBit()) {
        res++
    }
    return res
}

function doParse<V>(
    prefix: string,
    slice: Slice,
    n: number,
    res: Map<bigint, V>,
    extractor: (src: Slice) => V,
) {
    // Reading label
    const lb0 = slice.loadBit() ? 1 : 0
    let prefixLength = 0
    let pp = prefix

    if (lb0 === 0) {
        // Short label detected

        // Read
        prefixLength = readUnaryLength(slice)

        // Read prefix
        for (let i = 0; i < prefixLength; i++) {
            pp += slice.loadBit() ? "1" : "0"
        }
    } else {
        let lb1 = slice.loadBit() ? 1 : 0
        if (lb1 === 0) {
            // Long label detected
            prefixLength = slice.loadUint(Math.ceil(Math.log2(n + 1)))
            for (let i = 0; i < prefixLength; i++) {
                pp += slice.loadBit() ? "1" : "0"
            }
        } else {
            // Same label detected
            const bit = slice.loadBit() ? "1" : "0"
            prefixLength = slice.loadUint(Math.ceil(Math.log2(n + 1)))
            for (let i = 0; i < prefixLength; i++) {
                pp += bit
            }
        }
    }

    if (n - prefixLength === 0) {
        res.set(BigInt("0b" + pp), extractor(slice))
    } else {
        const left = slice.loadRef()
        const right = slice.loadRef()
        // NOTE: Left and right branches are implicitly contain prefixes '0' and '1'
        if (!left.isExotic) {
            doParse(pp + "0", left.beginParse(), n - prefixLength - 1, res, extractor)
        }
        if (!right.isExotic) {
            doParse(pp + "1", right.beginParse(), n - prefixLength - 1, res, extractor)
        }
    }
}

export function parseDict<V>(sc: Slice | null, keySize: number, extractor: (src: Slice) => V) {
    let res: Map<bigint, V> = new Map()
    if (sc) {
        doParse("", sc, keySize, res, extractor)
    }
    return res
}
