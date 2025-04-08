contract SerializeNormals {
    u8: Int as uint8;
    i16: Int as int16;
    u32: Int as uint32;
    i64: Int as int64;
    u128: Int as uint128;

    init() {
        self.u8 = 2;
        self.i16 = -32000;
        self.u32 = 4000000000;
        self.i64 = -5000000000;
        self.u128 = 100000000000000000000000;
    }
}