/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "@/core/boc/builder";
import type { Slice } from "@/core/boc/slice";

// acst_unchanged$0 = AccStatusChange;  // x -> x
// acst_frozen$10 = AccStatusChange;    // init -> frozen
// acst_deleted$11 = AccStatusChange;   // frozen -> deleted

export type AccountStatusChange = "unchanged" | "frozen" | "deleted";

export function loadAccountStatusChange(slice: Slice): AccountStatusChange {
    if (!slice.loadBit()) {
        return "unchanged";
    }
    if (slice.loadBit()) {
        return "deleted";
    } else {
        return "frozen";
    }
}

export function storeAccountStatusChange(src: AccountStatusChange) {
    return (builder: Builder) => {
        if (src == "unchanged") {
            builder.storeBit(0);
        } else if (src === "frozen") {
            builder.storeBit(1);
            builder.storeBit(0);
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        } else if (src === "deleted") {
            builder.storeBit(1);
            builder.storeBit(1);
        } else {
            throw Error("Invalid account status change");
        }
    };
}
