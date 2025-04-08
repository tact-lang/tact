contract SmallIntsInit {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
    i64: Int as int64;
    u64: Int as uint64;

    init() {
        self.i8 = -1;
        self.u8 = 255;
        self.i16 = -12345;
        self.u16 = 65535;
        self.i32 = -123456789;
        self.u32 = 4294967295;
        self.i64 = -123456789012345;
        self.u64 = 18446744073709551615;
    }
}