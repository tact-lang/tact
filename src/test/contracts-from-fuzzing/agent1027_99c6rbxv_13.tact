contract ExplicitSerialization {
    i8: Int as int8 = -5;
    i64: Int as int64 = -50;
    u8: Int as uint8 = 5;
    u64: Int as uint64 = 50;

    init() {
        self.i8 = 7;
        self.i64 = 700;
        self.u8 = 8;
        self.u64 = 800;
    }
}
