struct IntVariants {
    i257: Int;
    u8: Int as uint8;
    i16: Int as int16;
    u32: Int as uint32;
    i64: Int as int64;
}

contract IntVariantsTest {
    data: IntVariants;

    init() {
        self.data = IntVariants{
            i257: -1,
            u8: 1,
            i16: -2,
            u32: 3,
            i64: -4,
        };
    }
}