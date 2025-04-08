struct HasSerialization {
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;
    coin: Int as coins;
}

contract SerializeFields {
    d: HasSerialization;
    init() {
        self.d = HasSerialization{
            i8:-12,
            u16:12345,
            i32:-123456,
            u64:123456789,
            coin: ton("1")
        };
    }
}
