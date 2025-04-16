struct MixedSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Int as uint4;
    d: Int as int16;
}

contract MixedSerContract {
    mix: MixedSerialization;

    init() {
        self.mix = MixedSerialization{
            a: -1000,
            b: 12345,
            c: 10,
            d: -123,
        };
    }
}
