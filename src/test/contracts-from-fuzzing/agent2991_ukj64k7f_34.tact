contract Test {
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;

    init() {
        self.u4 = 15;
        self.u8 = 255;
        self.u16 = 65535;
        self.u32 = 4294967295;
    }
}