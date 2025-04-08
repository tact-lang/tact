struct S {
    a: Int;
    b: Int as uint8;
    c: Int as int32;
    d: Int as uint64;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            a: 111,
            b: 222,
            c: -3333,
            d: 4444
        };
    }
}