contract UintSizesTest {
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    i64: Int as int64;
    
    init() {
        self.u8 = 255;
        self.u16 = 65535;
        self.u32 = 123456;
        self.i64 = -1234567890;
    }
}