/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { bitsForNumber } from "@/core/utils/bits-for-number";

describe("bitsForNumber", () => {
    it("should work", () => {
        expect(bitsForNumber(0, "int")).toBe(1);
        expect(bitsForNumber(1, "int")).toBe(2);
        expect(bitsForNumber(-1, "int")).toBe(1);
        expect(bitsForNumber(-2, "int")).toBe(3);
    });
});
