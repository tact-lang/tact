struct SerialFormat {
    s8: Int as int8;
    u8: Int as uint8;
    s16: Int as int16;
    u16: Int as uint16;
    s32: Int as int32;
    u32: Int as uint32;
    s64: Int as int64;
    u64: Int as uint64;
    coinsVal: Int as coins;
}

contract TestSerialFormat {
    data: SerialFormat;

    init() {
        self.data = SerialFormat{
            s8:0, u8:0,
            s16:0, u16:0,
            s32:0, u32:0,
            s64:0, u64:0,
            coinsVal:0
        };
    }
}