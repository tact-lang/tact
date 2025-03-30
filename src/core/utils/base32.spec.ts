/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { base32Decode, base32Encode } from "./base32";

describe("base32", () => {
    it("should encode and decode", () => {
        expect(
            base32Decode(
                "fvcqmha5j3ceve35ammfrhqty46rkhi455otydstv66pk2tmf7rl25f3",
            ),
        ).toEqual(
            Buffer.from(
                "2D45061C1D4EC44A937D0318589E13C73D151D1CEF5D3C0E53AFBCF56A6C2FE2BD74BB",
                "hex",
            ),
        );
        expect(
            base32Encode(
                Buffer.from(
                    "2D45061C1D4EC44A937D0318589E13C73D151D1CEF5D3C0E53AFBCF56A6C2FE2BD74BB",
                    "hex",
                ),
            ),
        ).toEqual("fvcqmha5j3ceve35ammfrhqty46rkhi455otydstv66pk2tmf7rl25f3");
    });
});
