struct MixSerial {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as uint64;
    f: Int as uint128;
    g: Int as uint256;
}

contract TestContract {
    mix: MixSerial;

    init() {
        self.mix = MixSerial{
            a: 7,
            b: 15,
            c: 31,
            d: 63,
            e: 127,
            f: 255,
            g: 511
        };
    }
}
