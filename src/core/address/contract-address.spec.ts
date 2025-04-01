/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { beginCell } from "@/core/boc/builder";
import { Address } from "@/core/address/address";
import { contractAddress } from "@/core/address/contract-address";

describe("contractAddress", () => {
    it("should resolve address correctly", () => {
        const addr = contractAddress(0, {
            code: beginCell().storeUint(1, 8).endCell(),
            data: beginCell().storeUint(2, 8).endCell(),
        });
        expect(
            addr.equals(
                Address.parse(
                    "EQCSY_vTjwGrlvTvkfwhinJ60T2oiwgGn3U7Tpw24kupIhHz",
                ),
            ),
        ).toBe(true);
    });
});
