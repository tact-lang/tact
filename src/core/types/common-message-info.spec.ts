/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { beginCell } from "@/core/boc/builder";
import { testAddress, testExternalAddress } from "@/core/utils/test-address";
import type { CommonMessageInfo } from "@/core/types/common-message-info";
import {
    loadCommonMessageInfo,
    storeCommonMessageInfo,
} from "@/core/types/common-message-info";

describe("CommonMessageInfo", () => {
    it("should serialize external-in messages", () => {
        const msg: CommonMessageInfo = {
            type: "external-in",
            src: testExternalAddress("addr-2"),
            dest: testAddress(0, "addr-1"),
            importFee: 0n,
        };
        const cell = beginCell().store(storeCommonMessageInfo(msg)).endCell();
        const msg2 = loadCommonMessageInfo(cell.beginParse());
        const cell2 = beginCell().store(storeCommonMessageInfo(msg2)).endCell();
        expect(cell.equals(cell2)).toBe(true);
    });
});
