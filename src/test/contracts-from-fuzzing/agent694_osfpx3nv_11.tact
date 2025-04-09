contract UnsignedInts {
    u1: Int as uint1;
    u8: Int as uint8;
    u64: Int as uint64;
    u256: Int as uint256;

    init() {
        self.u1 = 1;
        self.u8 = 255;
        self.u64 = 100000;
        self.u256 = 999999999;
    }
}