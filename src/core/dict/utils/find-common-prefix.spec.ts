/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { findCommonPrefix } from "@/core/dict/utils/find-common-prefix";

describe("findCommonPrefix", () => {
    it("should find common prefix", () => {
        expect(findCommonPrefix(["0000111", "0101111", "0001111"])).toEqual(
            "0",
        );
        expect(findCommonPrefix(["0000111", "0001111", "0000101"])).toEqual(
            "000",
        );
        expect(findCommonPrefix(["0000111", "1001111", "0000101"])).toEqual("");
    });
});
