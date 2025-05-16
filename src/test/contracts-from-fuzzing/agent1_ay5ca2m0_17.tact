struct SerializeTest {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
    i64: Int as int64;
    u64: Int as uint64;
}

contract SerialExample {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            i8: 1,
            u8: 2,
            i16: 3,
            u16: 4,
            i32: 5,
            u32: 6,
            i64: 7,
            u64: 8
        };
    }
}
