struct S {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
}

contract MixedWidths {
    s: S;

    init() {
        self.s = S{
            a: 5,
            b: -5,
            c: 123,
            d: -12345,
            e: 123456,
        };
    }
}