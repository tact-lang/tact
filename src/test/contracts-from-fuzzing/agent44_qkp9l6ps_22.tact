struct EmbeddedUintFormats {
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    u128: Int as uint128;
}

contract EmbeddedUintFormatsTest {
    data: EmbeddedUintFormats;

    init() {
        self.data = EmbeddedUintFormats{
            u8: 200,
            u16: 65000,
            u32: 4000000000,
            u64: 1000000000000,
            u128: 340282366920938463463374607431768211455
        };
    }
}