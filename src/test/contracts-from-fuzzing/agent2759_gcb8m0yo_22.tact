contract FieldSerialization {
    u4: Int as uint4;
    i4: Int as int4;
    u16: Int as uint16;
    i16: Int as int16;
    u128: Int as uint128;
    i128: Int as int128;

    init() {
        self.u4 = 9;
        self.i4 = -7;
        self.u16 = 500;
        self.i16 = -200;
        self.u128 = 1234567890123456789;
        self.i128 = -1234567890123456789;
    }
}