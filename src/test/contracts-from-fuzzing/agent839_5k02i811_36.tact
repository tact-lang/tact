contract SerializeMany {
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
    i128: Int as int128;
    i256: Int as int256;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
    u256: Int as uint256;
    init() {
        self.i8 = -1;
        self.i16 = -2;
        self.i32 = -3;
        self.i64 = -4;
        self.i128 = -5;
        self.i256 = -6;
        self.u8 = 1;
        self.u16 = 2;
        self.u32 = 3;
        self.u64 = 4;
        self.u128 = 5;
        self.u256 = 6;
    }
}