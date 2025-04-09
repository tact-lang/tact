struct MultiInt {
    i8: Int as int8;
    u8: Int as uint8;
    i32: Int as int32;
    u64: Int as uint64;
    i257: Int as int257;
}

contract IntWidths {
    data: MultiInt;

    init() {
        self.data = MultiInt{
            i8: -100,
            u8: 250,
            i32: -123456,
            u64: 12345678901234,
            i257: -1
        };
    }
}
