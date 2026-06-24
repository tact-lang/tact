struct MixSerialize {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
}

contract SerialTest {
    s: MixSerialize;

    init() {
        self.s = MixSerialize{
            a: -10,
            b: 200,
            c: -3000,
            d: 50000,
            e: -70000,
            f: 3000000000
        };
    }
}