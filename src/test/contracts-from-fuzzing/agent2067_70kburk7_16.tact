contract MixedSerialization {
    s8: Int as int8;
    u8: Int as uint8;
    s16: Int as int16;
    u16: Int as uint16;
    s24: Int as int24;
    u24: Int as uint24;
    s64: Int as int64;
    u64: Int as uint64;

    init() {
        self.s8 = -10;
        self.u8 = 250;
        self.s16 = -1000;
        self.u16 = 65000;
        self.s24 = -5000000;
        self.u24 = 10000000;
        self.s64 = -5000000000;
        self.u64 = 10000000000;
    }
}