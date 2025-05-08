contract IntVariants {
    i: Int;
    i8: Int as int8;
    u8: Int as uint8;
    i64: Int as int64;
    u64: Int as uint64;

    init() {
        self.i = -1;
        self.i8 = -128;
        self.u8 = 255;
        self.i64 = -9999;
        self.u64 = 10000;
    }
}