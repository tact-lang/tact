struct SerializeFormats {
    i64: Int as int64;
    u32: Int as uint32;
    i8: Int as int8;
    u4: Int as uint4;
    i257: Int as int257;
}

contract TestSerializeFormats {
    data: SerializeFormats;

    init() {
        self.data = SerializeFormats{
            i64: 100,
            u32: 100,
            i8: 10,
            u4: 5,
            i257: -1
        };
    }
}
