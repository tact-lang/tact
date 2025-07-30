struct S {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as int128;
    g: Int;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            a: 3,
            b: 10,
            c: 100,
            d: 1000,
            e: 10000,
            f: 1000000,
            g: 100000000
        };
    }
}