struct IntVariants {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
}

contract IntVariantsContract {
    data: IntVariants;
    init() {
        self.data = IntVariants {
            i8: 0,
            u8: 0,
            i16: 0,
            u16: 0,
            i32: 0,
            u32: 0,
        };
    }
}