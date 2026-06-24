contract IntSerializations {
    u1: Int as uint1;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
    normal: Int;

    init() {
        self.u1 = 1;
        self.u8 = 8;
        self.u16 = 16;
        self.u32 = 32;
        self.u64 = 64;
        self.i8 = -8;
        self.i16 = -16;
        self.i32 = -32;
        self.i64 = -64;
        self.normal = 100;
    }
}