contract ScalarSerializations {
    s8: Int as int8 = -8;
    u8: Int as uint8 = 8;
    s64: Int as int64 = -64;
    u64: Int as uint64 = 64;

    init() {
        self.s8 = 7;
        self.u8 = 255;
        self.s64 = -123456789;
        self.u64 = 123456789;
    }
}