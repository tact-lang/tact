contract LargeTypes {
    i1: Int as int1;
    u4: Int as uint4;
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
    i64: Int as int64;
    u64: Int as uint64;
    i128: Int as int128;
    u128: Int as uint128;
    i256: Int as int256;
    u256: Int as uint256;

    init() {
        self.i1 = 1;
        self.u4 = 15;
        self.i8 = -128;
        self.u8 = 255;
        self.i16 = -32768;
        self.u16 = 65535;
        self.i32 = -2147483648;
        self.u32 = 4294967295;
        self.i64 = -9223372036854775808;
        self.u64 = 18446744073709551615;
        self.i128 = -170141183460469231731687303715884105728;
        self.u128 = 340282366920938463463374607431768211455;
        self.i256 = -115792089237316195423570985008687907853269984665640564039457584007913129639936;
        self.u256 = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    }
}