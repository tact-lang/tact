contract DifferentSerializations {
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    s1: Int as int1;
    s8: Int as int8;
    s16: Int as int16;

    init() {
        self.u4=1; self.u8=2; self.u16=3; self.u32=4;
        self.s1= -1; self.s8= -2; self.s16= -3;
    }
}