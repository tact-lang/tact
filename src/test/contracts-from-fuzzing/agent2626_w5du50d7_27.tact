contract MultiIntSizes {
    u8: Int as uint8;
    i8: Int as int8;
    u16: Int as uint16;
    i16: Int as int16;
    u32: Int as uint32;
    i32: Int as int32;
    u64: Int as uint64;
    i64: Int as int64;
    u128: Int as uint128;
    i128: Int as int128;

    init() {
        self.u8 = 255;
        self.i8 = -128;
        self.u16 = 65535;
        self.i16 = -32768;
        self.u32 = 4294967295;
        self.i32 = -2147483648;
        self.u64 = 18446744073709551615;
        self.i64 = -9223372036854775808;
        self.u128 = 340282366920938463463374607431768211455;
        self.i128 = -170141183460469231731687303715884105728;
    }
}