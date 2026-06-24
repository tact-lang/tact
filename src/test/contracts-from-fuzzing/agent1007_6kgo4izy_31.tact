struct MixedSerialization {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint64;
    e: Int;
}

contract ComplexSerialized {
    data: MixedSerialization;

    init() {
        self.data = MixedSerialization{
            a: -5,
            b: 5,
            c: -123456,
            d: 123456,
            e: 42,
        };
    }
}