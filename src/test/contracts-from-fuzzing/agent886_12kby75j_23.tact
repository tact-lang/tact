struct SerializationSizes {
    s8: Int as int8;
    s16: Int as int16;
    s32: Int as int32;
    s64: Int as int64;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
}

contract TestContract {
    data: SerializationSizes;

    init() {
        self.data = SerializationSizes{
            s8: -5,
            s16: -444,
            s32: -77777,
            s64: -12345678901234,
            u8: 250,
            u16: 65000,
            u32: 4000000000,
            u64: 16000000000000000000
        };
    }
}