/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { BitString } from "@/core/boc/bit-string";
import { CellType } from "@/core/boc/cell-type";
import type { Cell } from "@/core/boc/cell";
import { LevelMask } from "@/core/boc/cell-util/level-mask";
import type { ExoticPruned } from "@/core/boc/cell-util/exotic-pruned";
import { exoticPruned } from "@/core/boc/cell-util/exotic-pruned";
import { exoticMerkleProof } from "@/core/boc/cell-util/exotic-merkle-proof";
import { getRepresentation } from "@/core/boc/cell-util/descriptor";
import { sha256_sync } from "@ton/crypto";
import { exoticMerkleUpdate } from "@/core/boc/cell-util/exotic-merkle-update";
import { exoticLibrary } from "@/core/boc/cell-util/exotic-library";

//
// This function replicates unknown logic of resolving cell data
// https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/vm/cells/DataCell.cpp#L214
//
export function wonderCalculator(
    type: CellType,
    bits: BitString,
    refs: Cell[],
): { mask: LevelMask; hashes: Buffer[]; depths: number[] } {
    //
    // Resolving level mask
    //

    let levelMask: LevelMask;
    let pruned: ExoticPruned | null = null;
    if (type === CellType.Ordinary) {
        let mask = 0;
        for (const r of refs) {
            mask = mask | r.mask.value;
        }
        levelMask = new LevelMask(mask);
    } else if (type === CellType.PrunedBranch) {
        // Parse pruned
        pruned = exoticPruned(bits, refs);

        // Load level
        levelMask = new LevelMask(pruned.mask);
    } else if (type === CellType.MerkleProof) {
        // Parse proof
        exoticMerkleProof(bits, refs); // loaded

        const firstRef = refs[0];
        if (typeof firstRef === "undefined") {
            throw new Error("Bug");
        }

        // Load level
        levelMask = new LevelMask(firstRef.mask.value >> 1);
    } else if (type === CellType.MerkleUpdate) {
        // Parse update
        exoticMerkleUpdate(bits, refs); // // loaded

        const firstRef = refs[0];
        const secondRef = refs[1];
        if (
            typeof firstRef === "undefined" ||
            typeof secondRef === "undefined"
        ) {
            throw new Error("Bug");
        }

        // Load level
        levelMask = new LevelMask(
            (firstRef.mask.value | secondRef.mask.value) >> 1,
        );
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    } else if (type === CellType.Library) {
        // Parse library
        exoticLibrary(bits, refs); // // loaded

        // Load level
        levelMask = new LevelMask();
    } else {
        throw new Error("Unsupported exotic type");
    }

    //
    // Calculate hashes and depths
    // NOTE: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/vm/cells/DataCell.cpp#L214
    //

    const depths: number[] = [];
    const hashes: Buffer[] = [];

    const hashCount = type === CellType.PrunedBranch ? 1 : levelMask.hashCount;
    const totalHashCount = levelMask.hashCount;
    const hashIOffset = totalHashCount - hashCount;
    for (let levelI = 0, hashI = 0; levelI <= levelMask.level; levelI++) {
        if (!levelMask.isSignificant(levelI)) {
            continue;
        }

        if (hashI < hashIOffset) {
            hashI++;
            continue;
        }

        //
        // Bits
        //

        let currentBits: BitString;
        if (hashI === hashIOffset) {
            if (!(levelI === 0 || type === CellType.PrunedBranch)) {
                throw Error("Invalid");
            }
            currentBits = bits;
        } else {
            if (!(levelI !== 0 && type !== CellType.PrunedBranch)) {
                throw Error("Invalid: " + levelI + ", " + type);
            }
            const elem = hashes[hashI - hashIOffset - 1];
            if (typeof elem === "undefined") {
                throw new Error("Bug");
            }
            currentBits = new BitString(elem, 0, 256);
        }

        //
        // Depth
        //

        let currentDepth = 0;
        for (const c of refs) {
            let childDepth: number;
            if (type == CellType.MerkleProof || type == CellType.MerkleUpdate) {
                childDepth = c.depth(levelI + 1);
            } else {
                childDepth = c.depth(levelI);
            }
            currentDepth = Math.max(currentDepth, childDepth);
        }
        if (refs.length > 0) {
            currentDepth++;
        }

        //
        // Hash
        //

        const representation = getRepresentation(
            bits,
            currentBits,
            refs,
            levelI,
            levelMask.apply(levelI).value,
            type,
        );
        const hash = sha256_sync(representation);

        //
        // Persist next
        //

        const destI = hashI - hashIOffset;
        depths[destI] = currentDepth;
        hashes[destI] = hash;

        //
        // Next
        //

        hashI++;
    }

    //
    // Calculate hash and depth for all levels
    //

    const resolvedHashes: Buffer[] = [];
    const resolvedDepths: number[] = [];
    if (pruned) {
        for (let i = 0; i < 4; i++) {
            const { hashIndex } = levelMask.apply(i);
            const { hashIndex: thisHashIndex } = levelMask;
            if (hashIndex !== thisHashIndex) {
                const p = pruned.pruned[hashIndex];
                if (typeof p === "undefined") {
                    throw new Error("Bug");
                }
                resolvedHashes.push(p.hash);
                resolvedDepths.push(p.depth);
            } else {
                const h = hashes[0];
                const d = depths[0];
                if (typeof h === "undefined" || typeof d === "undefined") {
                    throw new Error("Bug");
                }
                resolvedHashes.push(h);
                resolvedDepths.push(d);
            }
        }
    } else {
        for (let i = 0; i < 4; i++) {
            const ix = levelMask.apply(i).hashIndex;
            const h = hashes[ix];
            const d = depths[ix];
            if (typeof h === "undefined" || typeof d === "undefined") {
                throw new Error("Bug");
            }
            resolvedHashes.push(h);
            resolvedDepths.push(d);
        }
    }

    //
    // Result
    //

    return {
        mask: levelMask,
        hashes: resolvedHashes,
        depths: resolvedDepths,
    };
}
