/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { fromNano, toNano } from "@/core/utils/convert";

const stringCases: { nano: string; real: string }[] = [
    { real: "1", nano: "1000000000" },
    { real: "10", nano: "10000000000" },
    { real: "0.1", nano: "100000000" },
    { real: "0.33", nano: "330000000" },
    { real: "0.000000001", nano: "1" },
    { real: "10.000000001", nano: "10000000001" },
    { real: "1000000.000000001", nano: "1000000000000001" },
    { real: "100000000000", nano: "100000000000000000000" },
];

const numberCases: { nano: string; real: number }[] = [
    { real: -0, nano: "0" },
    { real: 0, nano: "0" },
    {
        real: 1e64,
        nano: "10000000000000000000000000000000000000000000000000000000000000000000000000",
    },
    { real: 1, nano: "1000000000" },
    { real: 10, nano: "10000000000" },
    { real: 0.1, nano: "100000000" },
    { real: 0.33, nano: "330000000" },
    { real: 0.000000001, nano: "1" },
    { real: 10.000000001, nano: "10000000001" },
    { real: 1000000.000000001, nano: "1000000000000001" },
    { real: 100000000000, nano: "100000000000000000000" },
];

describe("convert", () => {
    it("should throw an error for NaN", () => {
        expect(() => toNano(NaN)).toThrow();
    });
    it("should throw an error for Infinity", () => {
        expect(() => toNano(Infinity)).toThrow();
    });
    it("should throw an error for -Infinity", () => {
        expect(() => toNano(-Infinity)).toThrow();
    });
    it("should throw an error due to insufficient precision of number", () => {
        // eslint-disable-next-line no-loss-of-precision
        expect(() => toNano(10000000.000000001)).toThrow();
    });
    it("should convert numbers toNano", () => {
        for (const r of numberCases) {
            const c = toNano(r.real);
            expect(c).toBe(BigInt(r.nano));
        }
    });
    it("should convert strings toNano", () => {
        for (const r of stringCases) {
            const c = toNano(r.real);
            expect(c).toBe(BigInt(r.nano));
        }
    });
    it("should convert fromNano", () => {
        for (const r of stringCases) {
            const c = fromNano(r.nano);
            expect(c).toEqual(r.real);
        }
    });
});
