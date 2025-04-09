contract ManyUintSizes {
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
    u256: Int as uint256;

    init() {
        self.u4=1; self.u8=2; self.u16=3;
        self.u32=4; self.u64=5; self.u128=6; self.u256=7;
    }
}