contract OptionSerialization {
    u8: Int as uint8;
    u16: Int as uint16;
    i64: Int as int64;
    optI: Int?;
    optB: Bool?;

    init() {
        self.u8 = 255;
        self.u16 = 65535;
        self.i64 = -42;
        self.optI = null;
        self.optB = null;
    }
}