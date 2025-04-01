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
import { beginCell } from "@/core/boc/builder";

export function exoticMerkleProof(bits: BitString, refs: Cell[]) {
    const reader = new BitReader(bits);

    // type + hash + depth
    const size = 8 + 256 + 16;

    if (bits.length !== size) {
        throw new Error(
            `Merkle Proof cell must have exactly (8 + 256 + 16) bits, got "${bits.length}"`,
        );
    }

    const firstRef = refs[0];
    if (refs.length !== 1 || typeof firstRef === "undefined") {
        throw new Error(
            `Merkle Proof cell must have exactly 1 ref, got "${refs.length}"`,
        );
    }

    // Check type
    const type = reader.loadUint(8);
    if (type !== 3) {
        throw new Error(`Merkle Proof cell must have type 3, got "${type}"`);
    }

    // Check data
    const proofHash = reader.loadBuffer(32);
    const proofDepth = reader.loadUint(16);
    const refHash = firstRef.hash(0);
    const refDepth = firstRef.depth(0);

    if (proofDepth !== refDepth) {
        throw new Error(
            `Merkle Proof cell ref depth must be exactly "${proofDepth}", got "${refDepth}"`,
        );
    }

    if (!proofHash.equals(refHash)) {
        throw new Error(
            `Merkle Proof cell ref hash must be exactly "${proofHash.toString("hex")}", got "${refHash.toString("hex")}"`,
        );
    }

    return {
        proofDepth,
        proofHash,
    };
}

export function convertToMerkleProof(c: Cell): Cell {
    return beginCell()
        .storeUint(3, 8)
        .storeBuffer(c.hash(0))
        .storeUint(c.depth(0), 16)
        .storeRef(c)
        .endCell({ exotic: true });
}
