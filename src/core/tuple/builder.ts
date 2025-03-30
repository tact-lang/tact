/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Address } from "../address/address";
import { beginCell } from "../boc/builder";
import { Cell } from "../boc/cell";
import { Slice } from "../boc/slice";
import type { Maybe } from "../utils/maybe";
import type { TupleItem } from "./tuple";

export class TupleBuilder {
    private _tuple: TupleItem[] = [];

    writeNumber(v?: Maybe<bigint | number>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            this._tuple.push({ type: "int", value: BigInt(v) });
        }
    }

    writeBoolean(v?: Maybe<boolean>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            this._tuple.push({ type: "int", value: v ? -1n : 0n });
        }
    }

    writeBuffer(v?: Maybe<Buffer | null | undefined>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            this._tuple.push({
                type: "slice",
                cell: beginCell().storeBuffer(v).endCell(),
            });
        }
    }

    writeString(v?: Maybe<string>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            this._tuple.push({
                type: "slice",
                cell: beginCell().storeStringTail(v).endCell(),
            });
        }
    }

    writeCell(v?: Maybe<Cell | Slice>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            if (v instanceof Cell) {
                this._tuple.push({ type: "cell", cell: v });
            } else if (v instanceof Slice) {
                this._tuple.push({ type: "cell", cell: v.asCell() });
            }
        }
    }

    writeSlice(v?: Maybe<Cell | Slice>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            if (v instanceof Cell) {
                this._tuple.push({ type: "slice", cell: v });
            } else if (v instanceof Slice) {
                this._tuple.push({ type: "slice", cell: v.asCell() });
            }
        }
    }

    writeBuilder(v?: Maybe<Cell | Slice>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            if (v instanceof Cell) {
                this._tuple.push({ type: "builder", cell: v });
            } else if (v instanceof Slice) {
                this._tuple.push({ type: "builder", cell: v.asCell() });
            }
        }
    }

    writeTuple(v?: Maybe<TupleItem[]>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            this._tuple.push({ type: "tuple", items: v });
        }
    }

    writeAddress(v?: Maybe<Address>) {
        if (v === null || v === undefined) {
            this._tuple.push({ type: "null" });
        } else {
            this._tuple.push({
                type: "slice",
                cell: beginCell().storeAddress(v).endCell(),
            });
        }
    }

    build() {
        return [...this._tuple];
    }
}
