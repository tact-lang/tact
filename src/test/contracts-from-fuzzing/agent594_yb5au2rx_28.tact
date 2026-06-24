struct Packed {
    a: Int as uint2;
    b: Int as uint2;
    c: Int as uint2;
    d: Int as uint2;
    e: Int as uint2;
}

contract TinyPacked {
    p: Packed = Packed{ a: 1, b: 2, c: 3, d: 0, e: 1 };
}