/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import type { Cell } from "@/core/boc/cell";
import type { Slice } from "@/core/boc/slice";
import { Dictionary } from "@/core/dict/dictionary";
import type { Maybe } from "@/core/utils/maybe";
import type { SimpleLibrary } from "@/core/types/simple-library";
import { SimpleLibraryValue } from "@/core/types/simple-library";
import type { TickTock } from "@/core/types/tick-tock";
import { loadTickTock, storeTickTock } from "@/core/types/tick-tock";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L141
// _ split_depth:(Maybe (## 5)) special:(Maybe TickTock)
//  code:(Maybe ^Cell) data:(Maybe ^Cell)
//  library:(HashmapE 256 SimpleLib) = StateInit;

export interface StateInit {
    splitDepth?: Maybe<number>;
    special?: Maybe<TickTock>;
    code?: Maybe<Cell>;
    data?: Maybe<Cell>;
    libraries?: Maybe<Dictionary<bigint, SimpleLibrary>>;
}

export function loadStateInit(slice: Slice): StateInit {
    // Split Depth
    let splitDepth: Maybe<number>;
    if (slice.loadBit()) {
        splitDepth = slice.loadUint(5);
    }

    // TickTock
    let special: Maybe<TickTock>;
    if (slice.loadBit()) {
        special = loadTickTock(slice);
    }

    // Code and Data
    const code = slice.loadMaybeRef();
    const data = slice.loadMaybeRef();

    // Libs
    let libraries: Maybe<Dictionary<bigint, SimpleLibrary>> = slice.loadDict(
        Dictionary.Keys.BigUint(256),
        SimpleLibraryValue,
    );
    if (libraries.size === 0) {
        libraries = undefined;
    }

    return {
        splitDepth,
        special,
        code,
        data,
        libraries,
    };
}

export function storeStateInit(src: StateInit) {
    return (builder: Builder) => {
        if (src.splitDepth !== null && src.splitDepth !== undefined) {
            builder.storeBit(true);
            builder.storeUint(src.splitDepth, 5);
        } else {
            builder.storeBit(false);
        }
        if (src.special !== null && src.special !== undefined) {
            builder.storeBit(true);
            builder.store(storeTickTock(src.special));
        } else {
            builder.storeBit(false);
        }
        builder.storeMaybeRef(src.code);
        builder.storeMaybeRef(src.data);
        builder.storeDict(src.libraries);
    };
}
