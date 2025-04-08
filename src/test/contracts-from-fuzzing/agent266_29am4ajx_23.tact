struct SerializeSizes {
    i64: Int as int64;
    u4: Int as uint4;
    u16: Int as uint16;
    i8: Int as int8;
}

contract SerializeTest {
    data: SerializeSizes;

    init() {
        self.data = SerializeSizes{
            i64:1000,
            u4:10,
            u16:100,
            i8:5
        };
    }
}