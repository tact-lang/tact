contract SerializeWidths {
    i8: Int as int8;
    u8: Int as uint8;
    i64: Int as int64;
    u64: Int as uint64;

    init() {
        self.i8 = -128;
        self.u8 = 255;
        self.i64 = -9007199254740991;
        self.u64 = 9007199254740991;
    }
}