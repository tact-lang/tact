/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { CellType } from "@/core/boc/cell-type";

describe("CellType", () => {
    it("should match values in c++ code", () => {
        expect(CellType.Ordinary).toBe(-1);
        expect(CellType.PrunedBranch).toBe(1);
        expect(CellType.Library).toBe(2);
        expect(CellType.MerkleProof).toBe(3);
        expect(CellType.MerkleUpdate).toBe(4);
    });
});
