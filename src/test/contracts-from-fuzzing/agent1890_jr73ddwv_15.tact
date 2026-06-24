struct IntsVariousSizes {
    u4: Int as uint4;
    s8: Int as int8;
    u32: Int as uint32;
    s64: Int as int64;
    u128: Int as uint128;
}

contract IntSizesTest {
    sizes: IntsVariousSizes;

    init() {
        self.sizes = IntsVariousSizes{
            u4: 7,
            s8: -64,
            u32: 1000,
            s64: -100000,
            u128: 123456789
        };
    }
}