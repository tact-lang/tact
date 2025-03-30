/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { TupleItem } from "./tuple";

export class TupleReader {
    private readonly items: TupleItem[];

    constructor(items: TupleItem[]) {
        this.items = [...items];
    }

    get remaining() {
        return this.items.length;
    }

    peek() {
        if (this.items.length === 0) {
            throw Error("EOF");
        }
        return this.items[0];
    }

    pop() {
        const res = this.items[0];
        if (this.items.length === 0 || typeof res === 'undefined') {
            throw Error("EOF");
        }
        this.items.splice(0, 1);
        return res;
    }

    skip(num: number = 1) {
        for (let i = 0; i < num; i++) {
            this.pop();
        }
        return this;
    }

    readBigNumber() {
        const popped = this.pop();
        if (popped.type !== "int") {
            throw Error("Not a number");
        }
        return popped.value;
    }

    readBigNumberOpt() {
        const popped = this.pop();
        if (popped.type === "null") {
            return null;
        }
        if (popped.type !== "int") {
            throw Error("Not a number");
        }
        return popped.value;
    }

    readNumber() {
        return Number(this.readBigNumber());
    }

    readNumberOpt() {
        const r = this.readBigNumberOpt();
        if (r !== null) {
            return Number(r);
        } else {
            return null;
        }
    }

    readBoolean() {
        const res = this.readNumber();
        return res === 0 ? false : true;
    }

    readBooleanOpt() {
        const res = this.readNumberOpt();
        if (res !== null) {
            return res === 0 ? false : true;
        } else {
            return null;
        }
    }

    readAddress() {
        const r = this.readCell().beginParse().loadAddress();
        if (r !== null) {
            return r;
        } else {
            throw Error("Not an address");
        }
    }

    readAddressOpt() {
        const r = this.readCellOpt();
        if (r !== null) {
            return r.beginParse().loadMaybeAddress();
        } else {
            return null;
        }
    }

    readCell() {
        const popped = this.pop();
        if (
            popped.type !== "cell" &&
            popped.type !== "slice" &&
            popped.type !== "builder"
        ) {
            throw Error("Not a cell: " + popped.type);
        }
        return popped.cell;
    }

    readCellOpt() {
        const popped = this.pop();
        if (popped.type === "null") {
            return null;
        }
        if (
            popped.type !== "cell" &&
            popped.type !== "slice" &&
            popped.type !== "builder"
        ) {
            throw Error("Not a cell");
        }
        return popped.cell;
    }

    readTuple() {
        const popped = this.pop();
        if (popped.type !== "tuple") {
            throw Error("Not a tuple");
        }
        return new TupleReader(popped.items);
    }

    readTupleOpt() {
        const popped = this.pop();
        if (popped.type === "null") {
            return null;
        }
        if (popped.type !== "tuple") {
            throw Error("Not a tuple");
        }
        return new TupleReader(popped.items);
    }

    private static readLispList(reader: TupleReader | null) {
        const result: TupleItem[] = [];

        let tail = reader;
        while (tail !== null) {
            const head = tail.pop();
            const tail0 = tail.items[0];
            if (
                tail.items.length === 0 || typeof tail0 === 'undefined' || 
                (tail0.type !== "tuple" && tail0.type !== "null")
            ) {
                throw Error(
                    "Lisp list consists only from (any, tuple) elements and ends with null",
                );
            }

            tail = tail.readTupleOpt();
            result.push(head);
        }

        return result;
    }

    readLispListDirect(): TupleItem[] {
        const item = this.items[0];
        if (this.items.length === 1 && typeof item !== 'undefined' && item.type === "null") {
            return [];
        }

        return TupleReader.readLispList(this);
    }

    readLispList() {
        return TupleReader.readLispList(this.readTupleOpt());
    }

    readBuffer() {
        const s = this.readCell().beginParse();
        if (s.remainingRefs !== 0) {
            throw Error("Not a buffer");
        }
        if (s.remainingBits % 8 !== 0) {
            throw Error("Not a buffer");
        }
        return s.loadBuffer(s.remainingBits / 8);
    }

    readBufferOpt() {
        const r = this.readCellOpt();
        if (r !== null) {
            const s = r.beginParse();
            if (s.remainingRefs !== 0 || s.remainingBits % 8 !== 0) {
                throw Error("Not a buffer");
            }
            return s.loadBuffer(s.remainingBits / 8);
        } else {
            return null;
        }
    }

    readString() {
        const s = this.readCell().beginParse();
        return s.loadStringTail();
    }

    readStringOpt() {
        const r = this.readCellOpt();
        if (r !== null) {
            const s = r.beginParse();
            return s.loadStringTail();
        } else {
            return null;
        }
    }
}
