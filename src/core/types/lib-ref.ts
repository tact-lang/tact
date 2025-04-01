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

// Source: https://github.com/ton-blockchain/ton/blob/128a85bee568e84146f1e985a92ea85011d1e380/crypto/block/block.tlb#L385-L386
// libref_hash$0 lib_hash:bits256 = LibRef;
// libref_ref$1 library:^Cell = LibRef;

export interface LibRefHash {
    type: "hash";
    libHash: Buffer;
}

export interface LibRefRef {
    type: "ref";
    library: Cell;
}

export type LibRef = LibRefHash | LibRefRef;

export function loadLibRef(slice: Slice): LibRef {
    const type = slice.loadUint(1);
    if (type === 0) {
        return {
            type: "hash",
            libHash: slice.loadBuffer(32),
        };
    } else {
        return {
            type: "ref",
            library: slice.loadRef(),
        };
    }
}

export function storeLibRef(src: LibRef) {
    return (builder: Builder) => {
        if (src.type === "hash") {
            builder.storeUint(0, 1);
            builder.storeBuffer(src.libHash);
        } else {
            builder.storeUint(1, 1);
            builder.storeRef(src.library);
        }
    };
}
