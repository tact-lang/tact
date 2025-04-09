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

contract SerIntsTest {
    data: IntsWithSerialization;

    init() {
        self.data = IntsWithSerialization{
            i8: -8, i16: -16, i32: -32, i64: -64,
            u8: 8, u16: 16, u32: 32, u64: 64
        };
    }
}
