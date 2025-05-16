contract NestedSerializations {
    i64: Int as int64;
    u128: Int as uint128;
    i32: Int as int32;
    u8: Int as uint8;

    init() {
        self.i64 = -123;
        self.u128 = 1234567890;
        self.i32 = -42;
        self.u8 = 255;
    }
}
