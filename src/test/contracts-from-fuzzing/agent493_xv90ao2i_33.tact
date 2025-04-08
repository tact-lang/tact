contract SerializeEdgeCases {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;

    init() {
        self.i8 = -128;
        self.u8 = 255;
        self.i16 = -32768;
        self.u16 = 65535;
    }
}