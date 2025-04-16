struct SerialMix {
    a: Int as uint8;
    b: Int;
    c: Int as int32;
    d: Int?;
    e: Int as uint4;
}

contract SerialMixTest {
    data: SerialMix;

    init() {
        self.data = SerialMix{
            a: 1,
            b: 123456,
            c: -42,
            d: null,
            e: 7,
        };
    }
}