struct S {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int256;
}

contract SerFormats {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: -42,
            c: 1234567890123,
            d: -1000000000000000000,
        };
    }
}