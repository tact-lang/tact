struct S {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
}

contract Test {
    s: S;

    init() {
        self.s = S {
            a: 5,
            b: 10,
            c: -20,
            d: 1000
        };
    }
}