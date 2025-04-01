/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import inspectSymbol from "symbol.inspect";
import { BitString } from "@/core/boc/bit-string";
import { CellType } from "@/core/boc/cell-type";
import { Slice } from "@/core/boc/slice";
import type { LevelMask } from "@/core/boc/cell/level-mask";
import { resolveExotic } from "@/core/boc/cell/resolve-exotic";
import { wonderCalculator } from "@/core/boc/cell/wonder-calculator";
import { deserializeBoc, serializeBoc } from "@/core/boc/cell/serialization";
import { BitReader } from "@/core/boc/bit-reader";
import { beginCell } from "@/core/boc/builder";

/**
 * Cell as described in TVM spec
 */
export class Cell {
    static readonly EMPTY = new Cell();

    /**
     * Deserialize cells from BOC
     * @param src source buffer
     * @returns array of cells
     */
    static fromBoc(src: Buffer) {
        return deserializeBoc(src);
    }

    /**
     * Helper function that deserializes a single cell from BOC in base64
     * @param src source string
     */
    static fromBase64(src: string): Cell {
        const parsed = Cell.fromBoc(Buffer.from(src, "base64"));
        const cell = parsed[0];
        if (parsed.length !== 1 || typeof cell === "undefined") {
            throw new Error("Deserialized more than one cell");
        }
        return cell;
    }

    /**
     * Helper function that deserializes a single cell from BOC in hex
     * @param src source string
     */
    static fromHex(src: string): Cell {
        const parsed = Cell.fromBoc(Buffer.from(src, "hex"));
        const cell = parsed[0];
        if (parsed.length !== 1 || typeof cell === "undefined") {
            throw new Error("Deserialized more than one cell");
        }
        return cell;
    }

    // Public properties
    readonly type: CellType;
    readonly bits: BitString;
    readonly refs: Cell[];
    readonly mask: LevelMask;

    // Level and depth information
    private _hashes: Buffer[] = [];
    private _depths: number[] = [];

    constructor(opts?: { exotic?: boolean; bits?: BitString; refs?: Cell[] }) {
        // Resolve bits
        let bits = BitString.EMPTY;
        if (opts?.bits) {
            bits = opts.bits;
        }

        // Resolve refs
        let refs: Cell[] = [];
        if (opts?.refs) {
            refs = [...opts.refs];
        }

        // Resolve type
        let hashes: Buffer[];
        let depths: number[];
        let mask: LevelMask;
        let type = CellType.Ordinary;
        if (opts?.exotic) {
            // Resolve exotic cell
            const resolved = resolveExotic(bits, refs);

            // Perform wonders
            const wonders = wonderCalculator(resolved.type, bits, refs);

            // Copy results
            mask = wonders.mask;
            depths = wonders.depths;
            hashes = wonders.hashes;
            type = resolved.type;
        } else {
            // Check correctness
            if (refs.length > 4) {
                throw new Error("Invalid number of references");
            }
            if (bits.length > 1023) {
                throw new Error(`Bits overflow: ${bits.length} > 1023`);
            }

            // Perform wonders
            const wonders = wonderCalculator(CellType.Ordinary, bits, refs);

            // Copy results
            mask = wonders.mask;
            depths = wonders.depths;
            hashes = wonders.hashes;
            type = CellType.Ordinary;
        }

        // Set fields
        this.type = type;
        this.bits = bits;
        this.refs = refs;
        this.mask = mask;
        this._depths = depths;
        this._hashes = hashes;

        Object.freeze(this);
        Object.freeze(this.refs);
        Object.freeze(this.bits);
        Object.freeze(this.mask);
        Object.freeze(this._depths);
        Object.freeze(this._hashes);
    }

    /**
     * Check if cell is exotic
     */
    get isExotic() {
        return this.type !== CellType.Ordinary;
    }

    /**
     * Begin cell parsing
     * @returns a new slice
     */
    beginParse = (allowExotic: boolean = false) => {
        if (this.isExotic && !allowExotic) {
            throw new Error("Exotic cells cannot be parsed");
        }
        return new Slice(new BitReader(this.bits), this.refs);
    };

    /**
     * Get cell hash
     * @param level level
     * @returns cell hash
     */
    hash = (level: number = 3): Buffer => {
        const hashId = Math.min(this._hashes.length - 1, level);
        const hash = this._hashes[hashId];
        if (typeof hash === "undefined") {
            throw new Error("Invalid level");
        }
        return hash;
    };

    /**
     * Get cell depth
     * @param level level
     * @returns cell depth
     */
    depth = (level: number = 3): number => {
        const hashId = Math.min(this._depths.length - 1, level);
        const hash = this._depths[hashId];
        if (typeof hash === "undefined") {
            throw new Error("Invalid level");
        }
        return hash;
    };

    /**
     * Get cell level
     * @returns cell level
     */
    level = (): number => {
        return this.mask.level;
    };

    /**
     * Checks cell to be equal to another cell
     * @param other other cell
     * @returns true if cells are equal
     */
    equals = (other: Cell): boolean => {
        return this.hash().equals(other.hash());
    };

    /**
     * Serializes cell to BOC
     * @param opts options
     */
    toBoc(opts?: {
        idx?: boolean | null | undefined;
        crc32?: boolean | null | undefined;
    }): Buffer {
        const idx =
            opts && opts.idx !== null && opts.idx !== undefined
                ? opts.idx
                : false;
        const crc32 =
            opts && opts.crc32 !== null && opts.crc32 !== undefined
                ? opts.crc32
                : true;
        return serializeBoc(this, { idx, crc32 });
    }

    /**
     * Format cell to string
     * @param indent indentation
     * @returns string representation
     */
    toString(indent?: string): string {
        const id = indent ?? "";
        let t = "x";
        if (this.isExotic) {
            if (this.type === CellType.MerkleProof) {
                t = "p";
            } else if (this.type === CellType.MerkleUpdate) {
                t = "u";
            } else if (this.type === CellType.PrunedBranch) {
                t = "p";
            }
        }
        let s =
            id + (this.isExotic ? t : "x") + "{" + this.bits.toString() + "}";
        for (const i of this.refs) {
            s += "\n" + i.toString(id + " ");
        }
        return s;
    }

    /**
     * Convert cell to slice
     * @returns slice
     */
    asSlice() {
        return this.beginParse();
    }

    /**
     * Convert cell to a builder that has this cell stored
     * @returns builder
     */
    asBuilder() {
        return beginCell().storeSlice(this.asSlice());
    }

    [inspectSymbol] = () => this.toString();
}
