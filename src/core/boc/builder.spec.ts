/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { randomInt } from "crypto";
import Prando from "prando";
import { testAddress } from "../utils/test-address";
import { BitBuilder } from "./bit-builder";
import { BitReader } from "./bit-reader";
import { beginCell } from "./builder";

describe("BitReader", () => {
    it("should read uints from builder", () => {
        const prando = new Prando("test-1");
        for (let i = 0; i < 1000; i++) {
            const a = prando.nextInt(0, 281474976710655);
            const b = prando.nextInt(0, 281474976710655);
            const builder = beginCell();
            builder.storeUint(a, 48);
            builder.storeUint(b, 48);
            const bits = builder.endCell().bits;
            const reader = new BitReader(bits);
            expect(Number(reader.preloadUint(48))).toEqual(a);
            expect(Number(reader.loadUint(48))).toEqual(a);
            expect(Number(reader.preloadUint(48))).toEqual(b);
            expect(Number(reader.loadUint(48))).toEqual(b);
        }
    });
    it("should read ints from builder", () => {
        const prando = new Prando("test-2");
        for (let i = 0; i < 1000; i++) {
            const a = prando.nextInt(-281474976710655, 281474976710655);
            const b = prando.nextInt(-281474976710655, 281474976710655);
            const builder = beginCell();
            builder.storeInt(a, 49);
            builder.storeInt(b, 49);
            const bits = builder.endCell().bits;
            const reader = new BitReader(bits);
            expect(Number(reader.preloadInt(49))).toEqual(a);
            expect(Number(reader.loadInt(49))).toEqual(a);
            expect(Number(reader.preloadInt(49))).toEqual(b);
            expect(Number(reader.loadInt(49))).toEqual(b);
        }
    });
    it("should read var uints from builder", () => {
        const prando = new Prando("test-3");
        for (let i = 0; i < 1000; i++) {
            const sizeBits = prando.nextInt(4, 8);
            const a = prando.nextInt(0, 281474976710655);
            const b = prando.nextInt(0, 281474976710655);
            const builder = beginCell();
            builder.storeVarUint(a, sizeBits);
            builder.storeVarUint(b, sizeBits);
            const bits = builder.endCell().bits;
            const reader = new BitReader(bits);
            expect(Number(reader.preloadVarUint(sizeBits))).toEqual(a);
            expect(Number(reader.loadVarUint(sizeBits))).toEqual(a);
            expect(Number(reader.preloadVarUint(sizeBits))).toEqual(b);
            expect(Number(reader.loadVarUint(sizeBits))).toEqual(b);
        }
    });
    it("should read var ints from builder", () => {
        const prando = new Prando("test-4");
        for (let i = 0; i < 1000; i++) {
            const sizeBits = prando.nextInt(4, 8);
            const a = prando.nextInt(-281474976710655, 281474976710655);
            const b = prando.nextInt(-281474976710655, 281474976710655);
            const builder = beginCell();
            builder.storeVarInt(a, sizeBits);
            builder.storeVarInt(b, sizeBits);
            const bits = builder.endCell().bits;
            const reader = new BitReader(bits);
            expect(Number(reader.preloadVarInt(sizeBits))).toEqual(a);
            expect(Number(reader.loadVarInt(sizeBits))).toEqual(a);
            expect(Number(reader.preloadVarInt(sizeBits))).toEqual(b);
            expect(Number(reader.loadVarInt(sizeBits))).toEqual(b);
        }
    });
    it("should read coins from builder", () => {
        const prando = new Prando("test-5");
        for (let i = 0; i < 1000; i++) {
            const a = prando.nextInt(0, 281474976710655);
            const b = prando.nextInt(0, 281474976710655);
            const builder = beginCell();
            builder.storeCoins(a);
            builder.storeCoins(b);
            const bits = builder.endCell().bits;
            const reader = new BitReader(bits);
            expect(Number(reader.preloadCoins())).toEqual(a);
            expect(Number(reader.loadCoins())).toEqual(a);
            expect(Number(reader.preloadCoins())).toEqual(b);
            expect(Number(reader.loadCoins())).toEqual(b);
        }
    });

    it("should read address from builder", () => {
        for (let i = 0; i < 1000; i++) {
            const a =
                randomInt(20) === 0 ? testAddress(-1, "test-1-" + i) : null;
            const b = testAddress(0, "test-2-" + i);
            const builder = beginCell();
            builder.storeAddress(a);
            builder.storeAddress(b);
            const bits = builder.endCell().bits;
            const reader = new BitReader(bits);
            if (a) {
                expect(reader.loadMaybeAddress()!.toString()).toEqual(
                    a.toString(),
                );
            } else {
                expect(reader.loadMaybeAddress()).toBeNull();
            }
            expect(reader.loadAddress().toString()).toEqual(b.toString());
        }
    });

    it("should read string tails from builder", () => {
        const prando = new Prando("test-6");
        for (let i = 0; i < 1000; i++) {
            const a = prando.nextString(prando.nextInt(0, 1024));
            const b = prando.nextString(prando.nextInt(0, 1024));
            const builder = beginCell();
            builder.storeStringRefTail(a);
            builder.storeStringTail(b);
            const sc = builder.endCell().beginParse();
            expect(sc.loadStringRefTail()).toEqual(a);
            expect(sc.loadStringTail()).toEqual(b);
        }
    });
});
