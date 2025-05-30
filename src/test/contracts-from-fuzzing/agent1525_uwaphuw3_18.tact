struct MixedBits {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
}

contract BitsMixTest {
    data: MixedBits;

    init() {
        self.data = MixedBits{
            a: -5,
            b: 5,
            c: -50,
            d: 50,
            e: -500,
            f: 500,
        };
    }
}