/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import { beginCell } from "../boc/builder";
import { Cell } from "../boc/cell";
import { exoticMerkleProof } from "../boc/cell/exotic-merkle-proof";
import { exoticMerkleUpdate } from "../boc/cell/exotic-merkle-update";
import { Dictionary } from "./dictionary";
import fs from "fs";
import { BitString } from "../boc/bit-string";

function storeBits(builder: Builder, src: string) {
    for (const s of src) {
        if (s === "0") {
            builder.storeBit(0);
        } else {
            builder.storeBit(1);
        }
    }
    return builder;
}

describe("Dictionary", () => {
    it("should parse and serialize dict from example", () => {
        const root = storeBits(beginCell(), "11001000")
            .storeRef(
                storeBits(beginCell(), "011000")
                    .storeRef(
                        storeBits(beginCell(), "1010011010000000010101001"),
                    )
                    .storeRef(
                        storeBits(beginCell(), "1010000010000000100100001"),
                    ),
            )
            .storeRef(storeBits(beginCell(), "1011111011111101111100100001"))
            .endCell();

        // Unpack
        const dict = Dictionary.loadDirect(
            Dictionary.Keys.Uint(16),
            Dictionary.Values.Uint(16),
            root.beginParse(),
        );
        expect(dict.get(13)).toBe(169);
        expect(dict.get(17)).toBe(289);
        expect(dict.get(239)).toBe(57121);

        // Empty
        const fromEmpty = Dictionary.empty<number, number>();
        fromEmpty.set(13, 169);
        fromEmpty.set(17, 289);
        fromEmpty.set(239, 57121);

        // Pack
        const packed = beginCell().storeDictDirect(dict).endCell();
        const packed2 = beginCell()
            .storeDictDirect(
                fromEmpty,
                Dictionary.Keys.Uint(16),
                Dictionary.Values.Uint(16),
            )
            .endCell();

        // Compare
        expect(packed.equals(root)).toBe(true);
        expect(packed2.equals(root)).toBe(true);
    });

    it("should parse config", () => {
        const cell = Cell.fromBoc(
            Buffer.from(
                fs.readFileSync(
                    __dirname + "/__testdata__/config.txt",
                    "utf-8",
                ),
                "base64",
            ),
        )[0]!;
        const configs = cell
            .beginParse()
            .loadDictDirect(Dictionary.Keys.Int(32), Dictionary.Values.Cell());
        const ids: number[] = [
            0, 1, 2, 4, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 20, 21, 22, 23,
            24, 25, 28, 29, 31, 32, 34, 71, 72, -999, -71,
        ];
        const keys = configs.keys();
        for (const i of ids) {
            expect(keys).toContain(i);
            expect(configs.get(i)).not.toBeUndefined();
            expect(configs.has(i)).toBe(true);
        }
    });

    it("should parse bridge config", () => {
        const cell = Cell.fromBoc(
            Buffer.from(
                fs.readFileSync(
                    __dirname + "/__testdata__/config.txt",
                    "utf-8",
                ),
                "base64",
            ),
        )[0]!;
        const configs = cell
            .beginParse()
            .loadDictDirect(Dictionary.Keys.Int(32), Dictionary.Values.Cell());

        for (const i of [71, 72]) {
            const r = configs.get(i)!;
            const config = r.beginParse();
            const bridgeAddress = config.loadBuffer(32);
            const oracleMultisigAddress = config.loadBuffer(32);
            const oracles = config.loadDict(
                Dictionary.Keys.BigUint(256),
                Dictionary.Values.Buffer(32),
            );
            const externalChainAddress = config.loadBuffer(32);
            // console.warn(oracles);
        }
    });

    it("should parse dictionary with empty values", () => {
        const cell = Cell.fromBoc(
            Buffer.from(
                fs.readFileSync(__dirname + "/__testdata__/empty_value.boc"),
            ),
        )[0]!;
        const testDict = Dictionary.loadDirect(
            Dictionary.Keys.BigUint(256),
            Dictionary.Values.BitString(0),
            cell,
        );
        expect(testDict.keys()[0]).toEqual(123n);
        expect(testDict.get(123n)!.length).toBe(0);
    });

    it("should correctly serialize BitString keys and values", () => {
        const keyLen = 9; // Not 8 bit aligned
        const keys = Dictionary.Keys.BitString(keyLen);
        const values = Dictionary.Values.BitString(72);
        const testKey = new BitString(Buffer.from("Test"), 0, keyLen);
        const testVal = new BitString(Buffer.from("BitString"), 0, 72);
        const testDict = Dictionary.empty(keys, values);

        testDict.set(testKey, testVal);
        expect(testDict.get(testKey)!.equals(testVal)).toBe(true);

        const serialized = beginCell().storeDictDirect(testDict).endCell();
        const dictDs = Dictionary.loadDirect(keys, values, serialized);
        expect(dictDs.get(testKey)!.equals(testVal)).toBe(true);
    });

    it("should generate merkle proofs", () => {
        const d = Dictionary.empty(
            Dictionary.Keys.Uint(8),
            Dictionary.Values.Uint(32),
        );
        d.set(1, 11);
        d.set(2, 22);
        d.set(3, 33);
        d.set(4, 44);
        d.set(5, 55);

        const dictHash = beginCell().storeDictDirect(d).endCell().hash();
        for (let k = 1; k <= 5; k++) {
            const proof = d.generateMerkleProof([k]);
            Cell.fromBoc(proof.toBoc());
            expect(exoticMerkleProof(proof.bits, proof.refs).proofHash).toEqual(
                dictHash,
            );

            // todo: parse the pruned dictionary and check the presence of the keys
        }

        for (let k = 1; k <= 3; k++) {
            const proof = d.generateMerkleProof([k, k + 1, k + 2]);
            Cell.fromBoc(proof.toBoc());
            expect(exoticMerkleProof(proof.bits, proof.refs).proofHash).toEqual(
                dictHash,
            );
        }

        expect(() => d.generateMerkleProof([6])).toThrow();
    });

    it("should generate merkle updates", () => {
        const d = Dictionary.empty(
            Dictionary.Keys.Uint(8),
            Dictionary.Values.Uint(32),
        );
        d.set(1, 11);
        d.set(2, 22);
        d.set(3, 33);
        d.set(4, 44);
        d.set(5, 55);

        for (let k = 1; k <= 5; k++) {
            const update = d.generateMerkleUpdate(k, d.get(k)! * 2);
            Cell.fromBoc(update.toBoc());
            expect(
                exoticMerkleUpdate(update.bits, update.refs).proofHash1,
            ).toEqual(
                Buffer.from(
                    "ee41b86bd71f8224ebd01848b4daf4cd46d3bfb3e119d8b865ce7c2802511de3",
                    "hex",
                ),
            );
            d.set(k, Math.floor(d.get(k)! / 2));
        }
    });
});
