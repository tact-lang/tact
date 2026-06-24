struct MixedSerial {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as uint16;
    e: Int as uint32;
}

contract SerialMixTest {
    v: MixedSerial;

    init() {
        self.v = MixedSerial{ a: 1, b: 2, c: 3, d: 4, e: 5 };
    }
}
