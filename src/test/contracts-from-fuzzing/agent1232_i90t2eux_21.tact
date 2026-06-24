struct MixedSerialize {
    a: Int as int8;
    b: Int as uint32;
    c: Int;
    d: Int as int64;
}

contract MixedSerialization {
    v: MixedSerialize;

    init() {
        self.v = MixedSerialize{
            a: -8,
            b: 1000,
            c: 123456789,
            d: -987654321,
        };
    }
}