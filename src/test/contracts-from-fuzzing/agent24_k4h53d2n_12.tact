struct HasSerialization {
    i8: Int as int8;
    u16: Int as uint16;
    u4: Int as uint4;
    i64: Int as int64;
    coinVal: Int as coins;
}

contract SerializedFields {
    data: HasSerialization;

    init() {
        self.data = HasSerialization{
            i8: -5,
            u16: 65535,
            u4: 15,
            i64: -123456789,
            coinVal: 1000,
        };
    }
}