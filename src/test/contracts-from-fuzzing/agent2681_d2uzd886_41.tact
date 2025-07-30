contract UIntSizes {
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
    u250: Int as uint250;

    init() {
        self.u8=1; self.u16=2; self.u32=3; self.u64=4; self.u128=5; self.u250=6;
    }
}