/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { BitBuilder } from "@/core/boc/bit-builder";
import { BitString } from "@/core/boc/bit-string";

describe("BitString", () => {
    let testOOB: (
        method: "substring" | "subbuffer",
        bs: BitString,
        offset: number,
        length: number,
    ) => void;
    beforeAll(() => {
        testOOB = (
            method: "substring" | "subbuffer",
            bs: BitString,
            offset: number,
            length: number,
        ) => {
            try {
                const bs2 = bs[method](offset, length);
                throw Error("Should fail");
            } catch (e: any) {
                expect(e.message.endsWith("out of bounds")).toBe(true);
            }
        };
    });

    it("should read bits", () => {
        const bs = new BitString(Buffer.from([0b10101010]), 0, 8);
        expect(bs.at(0)).toBe(true);
        expect(bs.at(1)).toBe(false);
        expect(bs.at(2)).toBe(true);
        expect(bs.at(3)).toBe(false);
        expect(bs.at(4)).toBe(true);
        expect(bs.at(5)).toBe(false);
        expect(bs.at(6)).toBe(true);
        expect(bs.at(7)).toBe(false);
        expect(bs.toString()).toEqual("AA");
    });
    it("should equals", () => {
        const a = new BitString(Buffer.from([0b10101010]), 0, 8);
        const b = new BitString(Buffer.from([0b10101010]), 0, 8);
        const c = new BitString(Buffer.from([0, 0b10101010]), 8, 8);
        expect(a.equals(b)).toBe(true);
        expect(b.equals(a)).toBe(true);
        expect(a.equals(c)).toBe(true);
        expect(c.equals(a)).toBe(true);
        expect(a.toString()).toEqual("AA");
        expect(b.toString()).toEqual("AA");
        expect(c.toString()).toEqual("AA");
    });
    it("should format strings", () => {
        expect(
            new BitString(Buffer.from([0b00000000]), 0, 1).toString(),
        ).toEqual("4_");
        expect(
            new BitString(Buffer.from([0b10000000]), 0, 1).toString(),
        ).toEqual("C_");
        expect(
            new BitString(Buffer.from([0b11000000]), 0, 2).toString(),
        ).toEqual("E_");
        expect(
            new BitString(Buffer.from([0b11100000]), 0, 3).toString(),
        ).toEqual("F_");
        expect(
            new BitString(Buffer.from([0b11100000]), 0, 4).toString(),
        ).toEqual("E");
        expect(
            new BitString(Buffer.from([0b11101000]), 0, 5).toString(),
        ).toEqual("EC_");
    });
    it("should do subbuffers", () => {
        const bs = new BitString(Buffer.from([1, 2, 3, 4, 5, 6, 7, 8]), 0, 64);
        const bs2 = bs.subbuffer(0, 16);
        expect(bs2!.length).toBe(2);
    });
    it("should do substrings", () => {
        const bs = new BitString(Buffer.from([1, 2, 3, 4, 5, 6, 7, 8]), 0, 64);
        const bs2 = bs.substring(0, 16);
        expect(bs2!.length).toBe(16);
    });
    it("should do empty substrings with requested length 0", () => {
        const bs = new BitString(Buffer.from([1, 2, 3, 4, 5, 6, 7, 8]), 0, 64);
        const bs2 = bs.substring(bs.length, 0);
        expect(bs2!.length).toBe(0);
    });
    it("should OOB when substring offset is out of bounds", () => {
        const bs = new BitString(Buffer.from([1, 2, 3, 4, 5, 6, 7, 8]), 0, 64);
        testOOB("substring", bs, bs.length + 1, 0);
        testOOB("substring", bs, -1, 0);
    });
    it("should OOB when subbuffer offset is out of bounds", () => {
        const bs = new BitString(Buffer.from([1, 2, 3, 4, 5, 6, 7, 8]), 0, 64);
        testOOB("subbuffer", bs, bs.length + 1, 0);
        testOOB("subbuffer", bs, -1, 0);
    });
    it("should OOB when offset is on the end of bitsring and length > 0", () => {
        const bs = new BitString(Buffer.from([1, 2, 3, 4, 5, 6, 7, 8]), 0, 64);
        testOOB("substring", bs, bs.length, 1);
    });
    it("should do empty subbuffers with requested length 0", () => {
        const bs = new BitString(Buffer.from([1, 2, 3, 4, 5, 6, 7, 8]), 0, 64);
        const bs2 = bs.subbuffer(bs.length, 0);
        expect(bs2!.length).toBe(0);
    });
    it("should OOB when offset is on the end of buffer and length > 0", () => {
        const bs = new BitString(Buffer.from([1, 2, 3, 4, 5, 6, 7, 8]), 0, 64);
        testOOB("subbuffer", bs, bs.length, 1);
    });
    it("should process monkey strings", () => {
        const cases = [
            ["001110101100111010", "3ACEA_"],
            ["01001", "4C_"],
            ["000000110101101010", "035AA_"],
            ["1000011111100010111110111", "87E2FBC_"],
            ["0111010001110010110", "7472D_"],
            ["", ""],
            ["0101", "5"],
            ["010110111010100011110101011110", "5BA8F57A_"],
            ["00110110001101", "3636_"],
            ["1110100", "E9_"],
            ["010111000110110", "5C6D_"],
            ["01", "6_"],
            ["1000010010100", "84A4_"],
            ["010000010", "414_"],
            ["110011111", "CFC_"],
            ["11000101001101101", "C536C_"],
            ["011100111", "73C_"],
            ["11110011", "F3"],
            ["011001111011111000", "67BE2_"],
            ["10101100000111011111", "AC1DF"],
            ["0100001000101110", "422E"],
            ["000110010011011101", "19376_"],
            ["10111001", "B9"],
            ["011011000101000001001001110000", "6C5049C2_"],
            ["0100011101", "476_"],
            ["01001101000001", "4D06_"],
            ["00010110101", "16B_"],
            ["01011011110", "5BD_"],
            ["1010101010111001011101", "AAB976_"],
            ["00011", "1C_"],
            ["11011111111001111100", "DFE7C"],
            ["1110100100110111001101011111000", "E93735F1_"],
            ["10011110010111100110100000", "9E5E682_"],
            ["00100111110001100111001110", "27C673A_"],
            ["01010111011100000000001110000", "57700384_"],
            ["010000001011111111111000", "40BFF8"],
            ["0011110001111000110101100001", "3C78D61"],
            ["101001011011000010", "A5B0A_"],
            ["1111", "F"],
            ["10101110", "AE"],
            ["1001", "9"],
            ["001010010", "294_"],
            ["110011", "CE_"],
            ["10000000010110", "805A_"],
            ["11000001101000100", "C1A24_"],
            ["1", "C_"],
            ["0100101010000010011101111", "4A8277C_"],
            ["10", "A_"],
            ["1010110110110110110100110010110", "ADB6D32D_"],
            ["010100000000001000111101011001", "50023D66_"],
        ] as const;
        for (const c of cases) {
            // Build string
            const builder = new BitBuilder();
            for (const f of c[0]) {
                builder.writeBit(f === "1");
            }
            const r = builder.build();

            // Check that string is valid
            for (let i = 0; i < c[0].length; i++) {
                expect(r.at(i)).toBe(c[0][i] === "1");
            }

            // Check to string
            expect(r.toString()).toEqual(c[1]);
        }
    });
});
