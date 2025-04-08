contract IntSerialization {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;

    init() {
        self.i8 = -5;
        self.u8 = 5;
        self.i16 = -50;
        self.u16 = 50;
        self.i32 = -500;
        self.u32 = 500;
    }
}