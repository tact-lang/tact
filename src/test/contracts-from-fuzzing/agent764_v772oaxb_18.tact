struct SerializeSizes {
    si8: Int as int8;
    su8: Int as uint8;
    si64: Int as int64;
    su64: Int as uint64;
    si257: Int as int257;
}

contract SerializationTest {
    data: SerializeSizes;

    init() {
        self.data = SerializeSizes{
            si8: -5,
            su8: 250,
            si64: -1234567,
            su64: 6543210,
            si257: -1
        };
    }
}