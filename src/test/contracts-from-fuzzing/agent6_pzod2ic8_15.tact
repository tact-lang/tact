contract IntSerialization {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i64: Int as int64;
    u64: Int as uint64;

    init() {
        self.i8 = -100;
        self.u8 = 200;
        self.i16 = -1000;
        self.u16 = 50000;
        self.i64 = -5000000000;
        self.u64 = 10000000000;
    }
}