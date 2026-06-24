struct WithSerializedInts {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint8;
}

contract IntSerializationFormats {
    data: WithSerializedInts;

    init() {
        self.data = WithSerializedInts{ a:42, b:-123456, c:255 };
    }
}
