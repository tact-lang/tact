/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { beginCell } from "@/core/boc/builder";
import { Cell } from "@/core/boc/cell";
import { loadStateInit, storeStateInit } from "@/core/types/state-init";

describe("StateInit", () => {
    it("should serialize to match golden-1", () => {
        // Serialize
        const boc = beginCell()
            .store(
                storeStateInit({
                    code: beginCell().storeUint(1, 8).endCell(),
                    data: beginCell().storeUint(2, 8).endCell(),
                }),
            )
            .endCell()
            .toBoc({ idx: false, crc32: true });
        expect(boc.toString("base64")).toEqual(
            "te6cckEBAwEACwACATQBAgACAQACAoN/wQo=",
        );

        // Parse
        const parsed = loadStateInit(Cell.fromBoc(boc)[0]!.beginParse());
        expect(parsed.libraries).toBeUndefined();
        expect(parsed.special).toBeUndefined();
        expect(parsed.splitDepth).toBeUndefined();
        const codeSlice = parsed.code!.beginParse();
        const a = codeSlice.loadUint(8);
        expect(a).toBe(1);
        codeSlice.endParse();
        const dataSlice = parsed.data!.beginParse();
        const b = dataSlice.loadUint(8);
        expect(b).toBe(2);
        dataSlice.endParse();
    });
});
