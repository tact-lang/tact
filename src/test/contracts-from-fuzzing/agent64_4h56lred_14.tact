struct TinyBits {
    a: Int as uint1;
    b: Int as uint1;
    c: Int as uint2;
    d: Int as uint2;
    e: Int as uint3;
    f: Int as uint3;
}

contract TinyBitsTest {
    flags: TinyBits = TinyBits{
        a: 1,
        b: 0,
        c: 3,
        d: 1,
        e: 7,
        f: 6
    };
}