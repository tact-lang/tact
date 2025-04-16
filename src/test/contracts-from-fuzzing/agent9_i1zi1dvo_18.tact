contract MixedSerialization {
    i8: Int as int8;
    i32: Int as int32;
    i64: Int as int64;
    u1: Int as uint1;
    u4: Int as uint4;
    u8: Int as uint8;
    u32: Int as uint32;

    init() {
        self.i8 = -128;
        self.i32 = -12345678;
        self.i64 = -9876543210;
        self.u1 = 1;
        self.u4 = 15;
        self.u8 = 255;
        self.u32 = 4294967295;
    }
}