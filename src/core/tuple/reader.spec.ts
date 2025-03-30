/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { TupleReader } from "./reader";
import type { TupleItem } from "./tuple";
import fs from "fs";

describe("tuple", () => {
    it("should read cons", () => {
        const cons: TupleItem[] = [
            {
                type: "tuple",
                items: [
                    { type: "int", value: BigInt(1) },
                    {
                        type: "tuple",
                        items: [
                            { type: "int", value: BigInt(2) },
                            {
                                type: "tuple",
                                items: [
                                    { type: "int", value: BigInt(3) },
                                    { type: "null" },
                                ],
                            },
                        ],
                    },
                ],
            },
        ];
        const r = new TupleReader(cons);

        const items: TupleItem[] = [
            {
                type: "int",
                value: BigInt(1),
            },
            {
                type: "int",
                value: BigInt(2),
            },
            {
                type: "int",
                value: BigInt(3),
            },
        ];

        expect(r.readLispList()).toEqual(items);
    });

    it("should read ultra deep cons", () => {
        const fContent = fs.readFileSync("./src/tuple/ultra-deep-cons.json");
        const cons: TupleItem[] = JSON.parse(fContent.toString());

        const result = [];
        for (let index = 0; index < 187; index++) {
            if (![11, 82, 116, 154].includes(index)) {
                result.push({ type: "int", value: index.toString() });
            }
        }

        expect(new TupleReader(cons).readLispList()).toEqual(result);
    });

    it("should raise error on nontuple element in chain", () => {
        const cons: TupleItem[] = [
            {
                type: "int",
                value: BigInt(1),
            },
        ];

        const r = new TupleReader(cons);
        expect(() => r.readLispListDirect()).toThrowError(
            "Lisp list consists only from (any, tuple) elements",
        );
    });

    it("should return empty list if tuple is null", () => {
        const cons: TupleItem[] = [
            {
                type: "null",
            },
        ];

        let r = new TupleReader(cons);
        expect(r.readLispList()).toEqual([]);

        r = new TupleReader(cons);
        expect(r.readLispListDirect()).toEqual([]);
    });
});
