struct IntsWithSerialization {
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;
    u8: Int as uint8;
    u16: Int as uint16;
    u32: Int as uint32;
    u64: Int as uint64;
}

contract TestContract {
    data: IntsWithSerialization;

    init() {
        self.data = IntsWithSerialization{
            i8: 1,
            i16: 2,
            i32: 3,
            i64: 4,
            u8: 5,
            u16: 6,
            u32: 7,
            u64: 8,
        };
    }
}