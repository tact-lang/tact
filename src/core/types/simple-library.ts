/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import type { Cell } from "../boc/cell";
import type { Slice } from "../boc/slice";
import type { DictionaryValue } from "../dict/dictionary";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L145
// simple_lib$_ public:Bool root:^Cell = SimpleLib;

export interface SimpleLibrary {
    public: boolean;
    root: Cell;
}

export function loadSimpleLibrary(slice: Slice): SimpleLibrary {
    return {
        public: slice.loadBit(),
        root: slice.loadRef(),
    };
}

export function storeSimpleLibrary(src: SimpleLibrary) {
    return (builder: Builder) => {
        builder.storeBit(src.public);
        builder.storeRef(src.root);
    };
}

export const SimpleLibraryValue: DictionaryValue<SimpleLibrary> = {
    serialize(src, builder) {
        storeSimpleLibrary(src)(builder);
    },
    parse(src) {
        return loadSimpleLibrary(src);
    },
};
