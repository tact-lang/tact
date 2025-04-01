/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { BitReader } from "@/core/boc/bit-reader";
import type { BitString } from "@/core/boc/bit-string";
import type { Cell } from "@/core/boc/cell";

export function exoticMerkleUpdate(bits: BitString, refs: Cell[]) {
    const reader = new BitReader(bits);

    // type + hash + hash + depth + depth
    const size = 8 + 2 * (256 + 16);

    if (bits.length !== size) {
        throw new Error(
            `Merkle Update cell must have exactly (8 + (2 * (256 + 16))) bits, got "${bits.length}"`,
        );
    }

    const [firstRef, secondRef] = refs;
    if (refs.length !== 2 || typeof firstRef === 'undefined' || typeof secondRef === 'undefined') {
        throw new Error(
            `Merkle Update cell must have exactly 2 refs, got "${refs.length}"`,
        );
    }

    const type = reader.loadUint(8);
    if (type !== 4) {
        throw new Error(
            `Merkle Update cell type must be exactly 4, got "${type}"`,
        );
    }

    const proofHash1 = reader.loadBuffer(32);
    const proofHash2 = reader.loadBuffer(32);
    const proofDepth1 = reader.loadUint(16);
    const proofDepth2 = reader.loadUint(16);

    if (proofDepth1 !== firstRef.depth(0)) {
        throw new Error(
            `Merkle Update cell ref depth must be exactly "${proofDepth1}", got "${firstRef.depth(0)}"`,
        );
    }

    if (!proofHash1.equals(firstRef.hash(0))) {
        throw new Error(
            `Merkle Update cell ref hash must be exactly "${proofHash1.toString("hex")}", got "${firstRef.hash(0).toString("hex")}"`,
        );
    }

    if (proofDepth2 !== secondRef.depth(0)) {
        throw new Error(
            `Merkle Update cell ref depth must be exactly "${proofDepth2}", got "${secondRef.depth(0)}"`,
        );
    }

    if (!proofHash2.equals(secondRef.hash(0))) {
        throw new Error(
            `Merkle Update cell ref hash must be exactly "${proofHash2.toString("hex")}", got "${secondRef.hash(0).toString("hex")}"`,
        );
    }

    return {
        proofDepth1,
        proofDepth2,
        proofHash1,
        proofHash2,
    };
}
