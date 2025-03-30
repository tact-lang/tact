/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { crc16 } from "./crc16";

describe("crc16", () => {
    it("should match test vector", () => {
        expect(crc16(Buffer.from("123456789"))).toEqual(
            Buffer.from("31c3", "hex"),
        );
    });
});
