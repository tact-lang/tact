contract ManySerializableInts {
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
        self.i8 = 1;
        self.u8 = 2;
        self.i16 = 3;
        self.u16 = 4;
        self.i32 = 5;
        self.u32 = 6;
        self.i64 = 7;
        self.u64 = 8;
        self.i128 = 9;
        self.u128 = 10;
        self.i256 = 11;
        self.u256 = 12;
    }
}
