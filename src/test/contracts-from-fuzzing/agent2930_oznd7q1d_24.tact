struct WithUintFormats {
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
}

contract IntSizes {
    wi: WithUintFormats;

    init() {
        self.wi = WithUintFormats{
            u4: 3,
            u8: 5,
            u16: 12,
            u32: 500,
            u64: 70000,
            u128: 1000000000000,
        };
    }
}
