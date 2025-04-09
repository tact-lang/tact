contract SerializeRangeTest {
    s8: Int as int8;
    u8: Int as uint8;
    s16: Int as int16;
    u16: Int as uint16;
    s32: Int as int32;
    u32: Int as uint32;

    init() {
        self.s8 = -128;
        self.u8 = 255;
        self.s16 = -32768;
        self.u16 = 65535;
        self.s32 = -2147483648;
        self.u32 = 4294967295;
    }
}