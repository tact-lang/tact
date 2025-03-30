import type { Slice } from "../../boc/slice";

export function readUnaryLength(slice: Slice) {
    let res = 0;
    while (slice.loadBit()) {
        res++;
    }
    return res;
}
