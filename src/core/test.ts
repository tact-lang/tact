/**
 * First element stores length
 * Then ceil(length / 32) elements
 */
type Bits = Int32Array;

type Len =
    |  0 |  1 |  2 |  3 |  4 |  5 |  6 |  7
    |  8 |  9 | 10 | 11 | 12 | 13 | 14 | 15
    | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23
    | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 | 32

const empty = (len: number): Bits => {
    const arr = new Int32Array(1 + ((len + 31) / 32) | 0);
    arr[0] = len;
    return arr;
};

const getIndex = (i: number) => [1 + (i / 32 | 0), i >> 5];

type Ops<T> = {
    encode: (t: T) => Bits;
    decode: (b: Bits) => T;
}

interface Schema {
    bits: (len: number) => Ops<Bits>;
    seq: <T, U>(left: Ops<T>, right: Ops<U>) => Ops<[T, U]>;
}