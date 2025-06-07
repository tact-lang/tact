struct Wide {
    i64: Int as int64;
    u32: Int as uint32;
    u4: Int as uint4;
    i257: Int as int257;
    b: Bool;
    s: String;
}

contract SerializationEdgeCase {
    data: Wide;

    init() {
        self.data = Wide{
            i64: 999,
            u32: 123456,
            u4: 12,
            i257: -5,
            b: true,
            s: "big"
        };
    }
}