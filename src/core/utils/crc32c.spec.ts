/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { crc32c } from "./crc32c";

describe("src32c", () => {
    it("should match test vector", () => {
        expect(crc32c(Buffer.from("123456789"))).toEqual(
            Buffer.from("839206e3", "hex"),
        );
    });
});
