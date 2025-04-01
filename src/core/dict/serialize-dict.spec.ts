/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { beginCell } from "@/core/boc/builder";
import { serializeDict } from "@/core/dict/serialize-dict";

describe("serializeDict", () => {
    it("should build prefix tree", () => {
        // From docs
        const map: Map<bigint, bigint> = new Map();
        map.set(13n, 169n);
        map.set(17n, 289n);
        map.set(239n, 57121n);

        // Test serialization
        const builder = beginCell();
        serializeDict(map, 16, (src, cell) => cell.storeUint(src, 16), builder);
        const root = builder.endCell();
        expect(root).toMatchSnapshot();
    });
});
