/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Address } from "@/core/address/address";
import { BitString } from "@/core/boc/bit-string";
import { testAddress } from "@/core/utils/test-address";
import {
    deserializeInternalKey,
    serializeInternalKey,
} from "@/core/dict/utils/internal-key-serializer";

describe("internalKeySerializer", () => {
    it("should serialize numbers", () => {
        const cs = [0, -1, 1, 123123123, -123123123];
        for (const c of cs) {
            expect(deserializeInternalKey(serializeInternalKey(c))).toBe(c);
        }
    });
    it("should serialize bigint", () => {
        const cs = [
            0n,
            -1n,
            1n,
            123123123n,
            -123123123n,
            1231231231231237812683128376123n,
            -1231273612873681263871263871263n,
        ];
        for (const c of cs) {
            expect(deserializeInternalKey(serializeInternalKey(c))).toBe(c);
        }
    });
    it("should serialize addresses", () => {
        const cs = [
            testAddress(0, "1"),
            testAddress(-1, "1"),
            testAddress(0, "2"),
            testAddress(0, "4"),
        ];
        for (const c of cs) {
            expect(
                (
                    deserializeInternalKey(serializeInternalKey(c)) as Address
                ).equals(c),
            ).toBe(true);
        }
    });
    it("should serialize buffers", () => {
        const cs = [
            Buffer.from("00", "hex"),
            Buffer.from("ff", "hex"),
            Buffer.from("0f", "hex"),
            Buffer.from("0f000011002233456611", "hex"),
        ];
        for (const c of cs) {
            expect(
                (
                    deserializeInternalKey(serializeInternalKey(c)) as Buffer
                ).equals(c),
            ).toBe(true);
        }
    });
    it("should serialize bit strings", () => {
        const cs = [
            Buffer.from("00", "hex"),
            Buffer.from("ff", "hex"),
            Buffer.from("0f", "hex"),
            Buffer.from("0f000011002233456611", "hex"),
        ];
        for (const c of cs) {
            for (let i = 0; i < c.length * 8 - 1; i++) {
                const bs = new BitString(c, 0, c.length * 8 - i);
                const res = deserializeInternalKey(
                    serializeInternalKey(bs),
                ) as BitString;
                expect(res.equals(bs)).toBe(true);
            }
        }
    });
});
