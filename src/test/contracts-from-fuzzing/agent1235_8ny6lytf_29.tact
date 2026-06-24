contract ManySerializations2 {
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;
    i128: Int as int128;
    u256: Int as uint256;

    init() {
        self.i8 = 1;
        self.u16 = 2;
        self.i32 = 3;
        self.u64 = 4;
        self.i128 = 5;
        self.u256 = 6;
    }
}