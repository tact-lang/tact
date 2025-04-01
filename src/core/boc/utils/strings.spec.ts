/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { comment } from "@/core/types/_helpers";
import { readString, stringToCell } from "@/core/boc/utils/strings";

describe("strings", () => {
    const cases: string[][] = [
        ["123"],
        [
            "12345678901234567890123456789012345678901234567890123456789012345678901234567890",
        ],
        [
            "привет мир 👀 привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀",
        ],
    ];

    it.each(cases)("should serialize and parse strings", (c) => {
        const cell = stringToCell(c);
        expect(readString(cell.beginParse())).toEqual(c);
    });

    it.each(cases)(
        "should serialize and parse string with padded slice",
        (c) => {
            const cell = comment(c);

            expect(readString(cell.beginParse().skip(32))).toEqual(c);
        },
    );
});
