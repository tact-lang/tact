/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { BitReader } from "../bit-reader";
import type { BitString } from "../bit-string";
import type { Cell } from "../cell";

export function exoticLibrary(bits: BitString, refs: Cell[]) {
    const reader = new BitReader(bits);

    // type + hash
    const size = 8 + 256;

    if (bits.length !== size) {
        throw new Error(
            `Library cell must have exactly (8 + 256) bits, got "${bits.length}"`,
        );
    }

    // Check type
    const type = reader.loadUint(8);
    if (type !== 2) {
        throw new Error(`Library cell must have type 2, got "${type}"`);
    }

    return {};
}
