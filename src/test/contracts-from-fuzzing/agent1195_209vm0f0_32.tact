// Check multiple serialization types
contract SerFormats {
    i8: Int as int8;
    u8: Int as uint8;
    i32: Int as int32;
    u64: Int as uint64;
    i128: Int as int128;

    init() {
        self.i8 = -8;
        self.u8 = 250;
        self.i32 = -2000;
        self.u64 = 123456789;
        self.i128 = -987654321;
    }
}
