struct SerzIntFormats {
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
}

contract SerzFormatsTest {
    store: SerzIntFormats;

    init() {
        self.store = SerzIntFormats{
            u8: 1,
            u16: 2,
            u32: 3,
            i8: 4,
            i16: 5,
            i32: 6
        };
    }
}