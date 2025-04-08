struct S {
    a: Int as int64;
    b: Int as uint4;
    c: Int;
    d: Int as uint32;
    e: Int as int8;
}

contract SerializationMix {
    s: S;

    init() {
        self.s = S{
            a: -10,
            b: 5,
            c: 1000,
            d: 42,
            e: -5
        };
    }
}