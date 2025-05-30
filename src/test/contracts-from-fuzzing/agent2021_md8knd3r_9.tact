struct UInts {
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
}

contract UIntsContract {
    vals: UInts;

    init() {
        self.vals = UInts{
            u4: 5,
            u8: 255,
            u16: 65535,
            u32: 4294967295,
            u64: 18446744073709551615,
            u128: 340282366920938463463374607431768211455,
        };
    }
}
