contract SignedUnsigned {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;

    init() {
        self.i8 = -128;
        self.u8 = 255;
        self.i16 = -32768;
        self.u16 = 65535;
        self.i32 = -2147483648;
        self.u32 = 4294967295;
    }
}