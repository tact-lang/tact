/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import type { Slice } from "@/core/boc/slice";
import { Dictionary } from "@/core/dict/dictionary";
import type { Maybe } from "@/core/utils/maybe";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L120
// extra_currencies$_ dict:(HashmapE 32 (VarUInteger 32))
//  = ExtraCurrencyCollection;
//  currencies$_ grams:Grams other:ExtraCurrencyCollection
//            = CurrencyCollection;

export interface CurrencyCollection {
    other?: Maybe<Dictionary<number, bigint>>;
    coins: bigint;
}

export function loadCurrencyCollection(slice: Slice): CurrencyCollection {
    const coins = slice.loadCoins();
    const other = slice.loadDict(
        Dictionary.Keys.Uint(32),
        Dictionary.Values.BigVarUint(5 /* log2(32) */),
    );
    if (other.size === 0) {
        return { coins };
    } else {
        return { other, coins };
    }
}

export function storeCurrencyCollection(collection: CurrencyCollection) {
    return (builder: Builder) => {
        builder.storeCoins(collection.coins);
        if (collection.other) {
            builder.storeDict(collection.other);
        } else {
            builder.storeBit(0);
        }
    };
}
