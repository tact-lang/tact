struct MixedSerializations {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as int8;
    f: Int as int16;
    g: Int as int32;
}

contract MixedSerializeStorage {
    s: MixedSerializations;

    init() {
        self.s = MixedSerializations{
            a: 10,
            b: 20,
            c: 1000,
            d: 100000,
            e: -5,
            f: -100,
            g: -100000,
        };
    }
}