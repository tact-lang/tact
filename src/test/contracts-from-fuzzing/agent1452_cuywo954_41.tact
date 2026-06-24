struct IntSizes {
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
    s8: Int as int8;
    s16: Int as int16;
    s32: Int as int32;
    s64: Int as int64;
}

contract IntSizesStorage {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            u8: 1, u16: 2, u32: 3, u64: 4,
            s8: -1, s16: -2, s32: -3, s64: -4
        };
    }
}
