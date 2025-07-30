contract IntSerialization {
    u4: Int as uint4;
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;

    init() {
        self.u4 = 7;
        self.i8 = -7;
        self.u16 = 12345;
        self.i32 = -123456;
    }
}
