/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import { beginCell } from "../boc/builder";
import type { Cell } from "../boc/cell";
import type { Slice } from "../boc/slice";

const INT64_MIN = BigInt("-9223372036854775808");
const INT64_MAX = BigInt("9223372036854775807");

export type Tuple = { type: "tuple"; items: TupleItem[] };
export type TupleItemNull = { type: "null" };
export type TupleItemInt = { type: "int"; value: bigint };
export type TupleItemNaN = { type: "nan" };
export type TupleItemCell = { type: "cell"; cell: Cell };
export type TupleItemSlice = { type: "slice"; cell: Cell };
export type TupleItemBuilder = { type: "builder"; cell: Cell };
export type TupleItem =
    | TupleItemNull
    | TupleItemInt
    | TupleItemNaN
    | TupleItemCell
    | TupleItemSlice
    | TupleItemBuilder
    | Tuple;

// vm_stk_null#00 = VmStackValue;
// vm_stk_tinyint#01 value:int64 = VmStackValue;
// vm_stk_int#0201_ value:int257 = VmStackValue;
// vm_stk_nan#02ff = VmStackValue;
// vm_stk_cell#03 cell:^Cell = VmStackValue;

//_ cell:^Cell st_bits:(## 10) end_bits:(## 10) { st_bits <= end_bits }
//   st_ref:(#<= 4) end_ref:(#<= 4) { st_ref <= end_ref } = VmCellSlice;
// vm_stk_slice#04 _:VmCellSlice = VmStackValue;
// vm_stk_builder#05 cell:^Cell = VmStackValue;
// vm_stk_cont#06 cont:VmCont = VmStackValue;

// vm_tupref_nil$_ = VmTupleRef 0;
// vm_tupref_single$_ entry:^VmStackValue = VmTupleRef 1;
// vm_tupref_any$_ {n:#} ref:^(VmTuple (n + 2)) = VmTupleRef (n + 2);
// vm_tuple_nil$_ = VmTuple 0;
// vm_tuple_tcons$_ {n:#} head:(VmTupleRef n) tail:^VmStackValue = VmTuple (n + 1);
// vm_stk_tuple#07 len:(## 16) data:(VmTuple len) = VmStackValue;

function serializeTupleItem(src: TupleItem, builder: Builder) {
    if (src.type === "null") {
        builder.storeUint(0x00, 8);
    } else if (src.type === "int") {
        if (src.value <= INT64_MAX && src.value >= INT64_MIN) {
            builder.storeUint(0x01, 8);
            builder.storeInt(src.value, 64);
        } else {
            builder.storeUint(0x0100, 15);
            builder.storeInt(src.value, 257);
        }
    } else if (src.type === "nan") {
        builder.storeInt(0x02ff, 16);
    } else if (src.type === "cell") {
        builder.storeUint(0x03, 8);
        builder.storeRef(src.cell);
    } else if (src.type === "slice") {
        builder.storeUint(0x04, 8);
        builder.storeUint(0, 10);
        builder.storeUint(src.cell.bits.length, 10);
        builder.storeUint(0, 3);
        builder.storeUint(src.cell.refs.length, 3);
        builder.storeRef(src.cell);
    } else if (src.type === "builder") {
        builder.storeUint(0x05, 8);
        builder.storeRef(src.cell);
    } else if (src.type === "tuple") {
        let head: Cell | null = null;
        let tail: Cell | null = null;
        for (const [i, item] of src.items.entries()) {
            // Swap
            const s: Cell | null = head;
            head = tail;
            tail = s;

            if (i > 1) {
                head = beginCell().storeRef(tail!).storeRef(head!).endCell();
            }

            const bc = beginCell();
            serializeTupleItem(item, bc);
            tail = bc.endCell();
        }

        builder.storeUint(0x07, 8);
        builder.storeUint(src.items.length, 16);
        if (head) {
            builder.storeRef(head);
        }
        if (tail) {
            builder.storeRef(tail);
        }
    } else {
        throw Error("Invalid value");
    }
}

function parseStackItem(cs: Slice): TupleItem {
    const kind = cs.loadUint(8);
    if (kind === 0) {
        return { type: "null" };
    } else if (kind === 1) {
        return { type: "int", value: cs.loadIntBig(64) };
    } else if (kind === 2) {
        if (cs.loadUint(7) === 0) {
            return { type: "int", value: cs.loadIntBig(257) };
        } else {
            cs.loadBit(); // must eq 1
            return { type: "nan" };
        }
    } else if (kind === 3) {
        return { type: "cell", cell: cs.loadRef() };
    } else if (kind === 4) {
        const startBits = cs.loadUint(10);
        const endBits = cs.loadUint(10);
        const startRefs = cs.loadUint(3);
        const endRefs = cs.loadUint(3);

        // Copy to new cell
        const rs = cs.loadRef().beginParse();
        rs.skip(startBits);
        const dt = rs.loadBits(endBits - startBits);

        const builder = beginCell().storeBits(dt);

        // Copy refs if exist
        if (startRefs < endRefs) {
            for (let i = 0; i < startRefs; i++) {
                rs.loadRef();
            }
            for (let i = 0; i < endRefs - startRefs; i++) {
                builder.storeRef(rs.loadRef());
            }
        }

        return { type: "slice", cell: builder.endCell() };
    } else if (kind === 5) {
        return { type: "builder", cell: cs.loadRef() };
    } else if (kind === 7) {
        const length = cs.loadUint(16);
        const items: TupleItem[] = [];
        if (length > 1) {
            let head: Slice = cs.loadRef().beginParse();
            let tail: Slice = cs.loadRef().beginParse();
            items.unshift(parseStackItem(tail));
            for (let i = 0; i < length - 2; i++) {
                const ohead = head;
                head = ohead.loadRef().beginParse();
                tail = ohead.loadRef().beginParse();
                items.unshift(parseStackItem(tail));
            }
            items.unshift(parseStackItem(head));
        } else if (length === 1) {
            items.push(parseStackItem(cs.loadRef().beginParse()));
        }
        return { type: "tuple", items };
    } else {
        throw Error("Unsupported stack item");
    }
}

//
// Stack parsing
// Source: https://github.com/ton-foundation/ton/blob/ae5c0720143e231c32c3d2034cfe4e533a16d969/crypto/block/block.tlb#L783
//
// vm_stack#_ depth:(## 24) stack:(VmStackList depth) = VmStack;
// vm_stk_cons#_ {n:#} rest:^(VmStackList n) tos:VmStackValue = VmStackList (n + 1);
// vm_stk_nil#_ = VmStackList 0;
//

function serializeTupleTail(src: TupleItem[], builder: Builder) {
    const lastSrc = src[src.length - 1];
    if (src.length > 0 && typeof lastSrc !== 'undefined') {
        // rest:^(VmStackList n)
        const tail = beginCell();
        serializeTupleTail(src.slice(0, src.length - 1), tail);
        builder.storeRef(tail.endCell());

        // tos
        serializeTupleItem(lastSrc, builder);
    }
}

export function serializeTuple(src: TupleItem[]) {
    const builder = beginCell();
    builder.storeUint(src.length, 24);
    const r = [...src];
    serializeTupleTail(r, builder);
    return builder.endCell();
}

export function parseTuple(src: Cell): TupleItem[] {
    const res: TupleItem[] = [];
    let cs = src.beginParse();
    const size = cs.loadUint(24);
    for (let i = 0; i < size; i++) {
        const next = cs.loadRef();
        res.unshift(parseStackItem(cs));
        cs = next.beginParse();
    }
    return res;
}
