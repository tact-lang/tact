struct SerializeComplex {
    a: Int as uint8;
    b: String;
    c: Int as uint64;
    d: Int as int16;
    e: Bool;
}

contract ComplexSerialization {
    s: SerializeComplex;

    init() {
        self.s = SerializeComplex{
            a: 254,
            b: "serialize",
            c: 123456789,
            d: -12345,
            e: true,
        };
    }
}
