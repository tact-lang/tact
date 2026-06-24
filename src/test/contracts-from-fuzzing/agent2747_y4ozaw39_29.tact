contract IntSerializationTest {
    u8: Int as uint8;
    i8: Int as int8;
    u16: Int as uint16;
    i16: Int as int16;

    init() {
        self.u8 = 255;
        self.i8 = -128;
        self.u16 = 65535;
        self.i16 = -32768;
    }
}