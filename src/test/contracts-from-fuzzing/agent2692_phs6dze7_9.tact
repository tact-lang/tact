contract SerializationWidths {
    i64: Int as int64;
    u64: Int as uint64;
    i8: Int as int8;
    u8: Int as uint8;
    i257: Int as int257;

    init() {
        self.i64 = 1;
        self.u64 = 1;
        self.i8 = 1;
        self.u8 = 1;
        self.i257 = 1;
    }
}