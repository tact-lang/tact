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
import { CellType } from "../cell-type";
import { exoticLibrary } from "./exotic-library";
import { exoticMerkleProof } from "./exotic-merkle-proof";
import { exoticMerkleUpdate } from "./exotic-merkle-update";
import { exoticPruned } from "./exotic-pruned";
import { LevelMask } from "./level-mask";

function resolvePruned(
    bits: BitString,
    refs: Cell[],
): { type: CellType; depths: number[]; hashes: Buffer[]; mask: LevelMask } {
    // Parse pruned cell
    const pruned = exoticPruned(bits, refs);

    // Calculate parameters
    return {
        type: CellType.PrunedBranch,
        depths: pruned.pruned.map(x => x.depth),
        hashes: pruned.pruned.map(x => x.hash),
        mask: new LevelMask(pruned.mask),
    };
}

function resolveLibrary(
    bits: BitString,
    refs: Cell[],
): { type: CellType; depths: number[]; hashes: Buffer[]; mask: LevelMask } {
    // Parse library cell
    const pruned = exoticLibrary(bits, refs);

    // Calculate parameters
    const depths: number[] = [];
    const hashes: Buffer[] = [];
    const mask = new LevelMask();

    return {
        type: CellType.Library,
        depths,
        hashes,
        mask,
    };
}

function resolveMerkleProof(
    bits: BitString,
    refs: Cell[],
): { type: CellType; depths: number[]; hashes: Buffer[]; mask: LevelMask } {
    // Parse merkle proof cell
    const merkleProof = exoticMerkleProof(bits, refs);

    const firstRef = refs[0];
    if (typeof firstRef === 'undefined') {
        throw new Error("Bug");
    }

    // Calculate parameters
    const depths: number[] = [];
    const hashes: Buffer[] = [];
    const mask = new LevelMask(firstRef.level() >> 1);

    return {
        type: CellType.MerkleProof,
        depths,
        hashes,
        mask,
    };
}

function resolveMerkleUpdate(
    bits: BitString,
    refs: Cell[],
): { type: CellType; depths: number[]; hashes: Buffer[]; mask: LevelMask } {
    // Parse merkle proof cell
    const merkleUpdate = exoticMerkleUpdate(bits, refs);

    const firstRef = refs[0];
    const secondRef = refs[1];

    if (typeof firstRef === 'undefined' || typeof secondRef === 'undefined') {
        throw new Error("Bug");
    }

    // Calculate parameters
    const depths: number[] = [];
    const hashes: Buffer[] = [];
    const mask = new LevelMask((firstRef.level() | secondRef.level()) >> 1);

    return {
        type: CellType.MerkleUpdate,
        depths,
        hashes,
        mask,
    };
}

export function resolveExotic(
    bits: BitString,
    refs: Cell[],
): { type: CellType; depths: number[]; hashes: Buffer[]; mask: LevelMask } {
    const reader = new BitReader(bits);
    const type = reader.preloadUint(8);

    if (type === 1) {
        return resolvePruned(bits, refs);
    }

    if (type === 2) {
        return resolveLibrary(bits, refs);
    }

    if (type === 3) {
        return resolveMerkleProof(bits, refs);
    }

    if (type === 4) {
        return resolveMerkleUpdate(bits, refs);
    }

    throw Error("Invalid exotic cell type: " + type);
}
