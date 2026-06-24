contract SerializeNeg {
    i8: Int as int8;
    i16: Int as int16;
    u8: Int as uint8;
    u16: Int as uint16;
    init() {
        self.i8 = -128;
        self.i16 = -32768;
        self.u8 = 0;
        self.u16 = 0;
    }
}