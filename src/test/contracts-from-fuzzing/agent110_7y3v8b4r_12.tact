contract FieldsDifferentSerialization {
    i_u8: Int as uint8;
    i_i64: Int as int64;
    i_u32: Int as uint32;
    normal: Int;

    init() {
        self.i_u8 = 1;
        self.i_i64 = -2;
        self.i_u32 = 3;
        self.normal = 4;
    }
}