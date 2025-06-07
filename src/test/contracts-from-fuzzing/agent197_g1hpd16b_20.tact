struct WideInts {
    a: Int as uint4 = 3;
    b: Int as int64 = 64;
    c: Int as int1 = 0;
    d: Int as int32 = 1234;
}

contract SerializedInts {
    ints: WideInts = WideInts{ a: 3, b: 64, c: 0, d: 1234 };
}