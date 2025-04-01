/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { BitReader } from "@/core/boc/bit-reader";
import { BitString } from "@/core/boc/bit-string";
import { Cell } from "@/core/boc/cell";
import { topologicalSort } from "@/core/boc/cell/topological-sort";
import { bitsForNumber } from "@/core/utils/bits-for-number";
import { BitBuilder } from "@/core/boc/bit-builder";
import {
    getBitsDescriptor,
    getRefsDescriptor,
} from "@/core/boc/cell/descriptor";
import { bitsToPaddedBuffer } from "@/core/boc/utils/padded-bits";
import { crc32c } from "@/core/utils/crc32c";

function getHashesCount(levelMask: number) {
    return getHashesCountFromMask(levelMask & 7);
}

function getHashesCountFromMask(mask: number) {
    let n = 0;
    for (let i = 0; i < 3; i++) {
        n += mask & 1;
        mask = mask >> 1;
    }
    return n + 1; // 1 representation + up to 3 higher hashes
}

function readCell(reader: BitReader, sizeBytes: number) {
    // D1
    const d1 = reader.loadUint(8);
    const refsCount = d1 % 8;
    const exotic = !!(d1 & 8);

    // D2
    const d2 = reader.loadUint(8);
    const dataBytesize = Math.ceil(d2 / 2);
    const paddingAdded = !!(d2 % 2);

    const levelMask = d1 >> 5;
    const hasHashes = (d1 & 16) != 0;
    const hash_bytes = 32;

    const hashesSize = hasHashes ? getHashesCount(levelMask) * hash_bytes : 0;
    const depthSize = hasHashes ? getHashesCount(levelMask) * 2 : 0;

    reader.skip(hashesSize * 8);
    reader.skip(depthSize * 8);

    // Bits
    let bits = BitString.EMPTY;
    if (dataBytesize > 0) {
        if (paddingAdded) {
            bits = reader.loadPaddedBits(dataBytesize * 8);
        } else {
            bits = reader.loadBits(dataBytesize * 8);
        }
    }

    // Refs
    const refs: number[] = [];
    for (let i = 0; i < refsCount; i++) {
        refs.push(reader.loadUint(sizeBytes * 8));
    }

    // Result
    return {
        bits,
        refs,
        exotic,
    };
}

function calcCellSize(cell: Cell, sizeBytes: number) {
    return (
        2 /* D1+D2 */ +
        Math.ceil(cell.bits.length / 8) +
        cell.refs.length * sizeBytes
    );
}

export function parseBoc(src: Buffer) {
    const reader = new BitReader(new BitString(src, 0, src.length * 8));
    const magic = reader.loadUint(32);
    if (magic === 0x68ff65f3) {
        const size = reader.loadUint(8);
        const offBytes = reader.loadUint(8);
        const cells = reader.loadUint(size * 8);
        const roots = reader.loadUint(size * 8); // Must be 1
        const absent = reader.loadUint(size * 8);
        const totalCellSize = reader.loadUint(offBytes * 8);
        const index = reader.loadBuffer(cells * offBytes);
        const cellData = reader.loadBuffer(totalCellSize);
        return {
            size,
            offBytes,
            cells,
            roots,
            absent,
            totalCellSize,
            index,
            cellData,
            root: [0],
        };
    } else if (magic === 0xacc3a728) {
        const size = reader.loadUint(8);
        const offBytes = reader.loadUint(8);
        const cells = reader.loadUint(size * 8);
        const roots = reader.loadUint(size * 8); // Must be 1
        const absent = reader.loadUint(size * 8);
        const totalCellSize = reader.loadUint(offBytes * 8);
        const index = reader.loadBuffer(cells * offBytes);
        const cellData = reader.loadBuffer(totalCellSize);
        const crc32 = reader.loadBuffer(4);
        if (!crc32c(src.subarray(0, src.length - 4)).equals(crc32)) {
            throw Error("Invalid CRC32C");
        }
        return {
            size,
            offBytes,
            cells,
            roots,
            absent,
            totalCellSize,
            index,
            cellData,
            root: [0],
        };
    } else if (magic === 0xb5ee9c72) {
        const hasIdx = reader.loadUint(1);
        const hasCrc32c = reader.loadUint(1);
        reader.loadUint(1); // hasCacheBits
        reader.loadUint(2); // flags, must be 0
        const size = reader.loadUint(3);
        const offBytes = reader.loadUint(8);
        const cells = reader.loadUint(size * 8);
        const roots = reader.loadUint(size * 8);
        const absent = reader.loadUint(size * 8);
        const totalCellSize = reader.loadUint(offBytes * 8);
        const root: number[] = [];
        for (let i = 0; i < roots; i++) {
            root.push(reader.loadUint(size * 8));
        }
        let index: Buffer | null = null;
        if (hasIdx) {
            index = reader.loadBuffer(cells * offBytes);
        }
        const cellData = reader.loadBuffer(totalCellSize);
        if (hasCrc32c) {
            const crc32 = reader.loadBuffer(4);
            if (!crc32c(src.subarray(0, src.length - 4)).equals(crc32)) {
                throw Error("Invalid CRC32C");
            }
        }
        return {
            size,
            offBytes,
            cells,
            roots,
            absent,
            totalCellSize,
            index,
            cellData,
            root,
        };
    } else {
        throw Error("Invalid magic");
    }
}

export function deserializeBoc(src: Buffer) {
    //
    // Parse BOC
    //

    const boc = parseBoc(src);
    const reader = new BitReader(
        new BitString(boc.cellData, 0, boc.cellData.length * 8),
    );

    //
    // Load cells
    //

    const cells: {
        bits: BitString;
        refs: number[];
        exotic: boolean;
        result: Cell | null;
    }[] = [];
    for (let i = 0; i < boc.cells; i++) {
        const cll = readCell(reader, boc.size);
        cells.push({ ...cll, result: null });
    }

    //
    // Build cells
    //

    [...cells].reverse().map((cell) => {
        if (cell.result) {
            throw Error("Impossible");
        }
        const refs: Cell[] = [];
        for (const r of cell.refs) {
            if (!cells[r]?.result) {
                throw Error("Invalid BOC file");
            }
            refs.push(cells[r].result);
        }
        cell.result = new Cell({
            bits: cell.bits,
            refs,
            exotic: cell.exotic,
        });
    });

    //
    // Load roots
    //

    const roots: Cell[] = boc.root.map((root) => {
        const rootInfo = cells[root];
        if (typeof rootInfo === "undefined") {
            throw new Error("Root not found");
        }
        const cell = rootInfo.result;
        if (cell === null) {
            throw new Error("Root cell not found");
        }
        return cell;
    });

    //
    // Return
    //

    return roots;
}

function writeCellToBuilder(
    cell: Cell,
    refs: number[],
    sizeBytes: number,
    to: BitBuilder,
) {
    const d1 = getRefsDescriptor(cell.refs, cell.mask.value, cell.type);
    const d2 = getBitsDescriptor(cell.bits);
    to.writeUint(d1, 8);
    to.writeUint(d2, 8);
    to.writeBuffer(bitsToPaddedBuffer(cell.bits));
    for (const r of refs) {
        to.writeUint(r, sizeBytes * 8);
    }
}

export function serializeBoc(
    root: Cell,
    opts: { idx: boolean; crc32: boolean },
) {
    // Sort cells
    const allCells = topologicalSort(root);

    // Calculate parameters
    const cellsNum = allCells.length;
    const has_idx = opts.idx;
    const has_crc32c = opts.crc32;
    const has_cache_bits = false;
    const flags = 0;
    const sizeBytes = Math.max(
        Math.ceil(bitsForNumber(cellsNum, "uint") / 8),
        1,
    );
    let totalCellSize: number = 0;
    const index: number[] = [];
    for (const c of allCells) {
        const sz = calcCellSize(c.cell, sizeBytes);
        totalCellSize += sz;
        index.push(totalCellSize);
    }
    const offsetBytes = Math.max(
        Math.ceil(bitsForNumber(totalCellSize, "uint") / 8),
        1,
    );
    const totalSize =
        (4 + // magic
            1 + // flags and s_bytes
            1 + // offset_bytes
            3 * sizeBytes + // cells_num, roots, complete
            offsetBytes + // full_size
            1 * sizeBytes + // root_idx
            (has_idx ? cellsNum * offsetBytes : 0) +
            totalCellSize +
            (has_crc32c ? 4 : 0)) *
        8;

    // Serialize
    const builder = new BitBuilder(totalSize);
    builder.writeUint(0xb5ee9c72, 32); // Magic
    builder.writeBit(has_idx); // Has index
    builder.writeBit(has_crc32c); // Has crc32c
    builder.writeBit(has_cache_bits); // Has cache bits
    builder.writeUint(flags, 2); // Flags
    builder.writeUint(sizeBytes, 3); // Size bytes
    builder.writeUint(offsetBytes, 8); // Offset bytes
    builder.writeUint(cellsNum, sizeBytes * 8); // Cells num
    builder.writeUint(1, sizeBytes * 8); // Roots num
    builder.writeUint(0, sizeBytes * 8); // Absent num
    builder.writeUint(totalCellSize, offsetBytes * 8); // Total cell size
    builder.writeUint(0, sizeBytes * 8); // Root id == 0
    if (has_idx) {
        // Index
        for (const x of index) {
            builder.writeUint(x, offsetBytes * 8);
        }
    }
    for (const { cell, refs } of allCells) {
        // Cells
        writeCellToBuilder(cell, refs, sizeBytes, builder);
    }
    if (has_crc32c) {
        const crc32 = crc32c(builder.buffer()); // builder.buffer() is fast since it doesn't allocate new memory
        builder.writeBuffer(crc32);
    }

    // Sanity Check
    const res = builder.buffer();
    if (res.length !== totalSize / 8) {
        throw Error("Internal error");
    }
    return res;
}
