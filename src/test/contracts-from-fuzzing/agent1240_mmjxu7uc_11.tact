contract StructIntWidths {
    s: S;

    init() {
        self.s = S{
            a: 5,
            b: -5,
            c: 123456,
            d: -123456789,
            e: 1234567890123456789012345,
            f: -123456789012345678901234567890
        };
    }
}

struct S {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint120;
    f: Int as int257;
}
