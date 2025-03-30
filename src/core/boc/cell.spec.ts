/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { BitString } from "./bit-string";
import { Cell } from "./cell";
import { CellType } from "./cell-type";

describe("Cell", () => {
    it("should construct", () => {
        const cell = new Cell();
        expect(cell.type).toBe(CellType.Ordinary);
        expect(cell.bits.equals(new BitString(Buffer.alloc(0), 0, 0))).toEqual(
            true,
        );
        expect(cell.refs).toEqual([]);
    });
});
