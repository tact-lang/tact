struct SerializationTest {
    int8: Int as int8;
    uint8: Int as uint8;
    int16: Int as int16;
    uint16: Int as uint16;
    int32: Int as int32;
    uint32: Int as uint32;
    int64: Int as int64;
    uint64: Int as uint64;
}

contract SerializationContract {
    test: SerializationTest;

    init() {
        self.test = SerializationTest{
            int8: -128,
            uint8: 255,
            int16: -32768,
            uint16: 65535,
            int32: -2147483648,
            uint32: 4294967295,
            int64: -9223372036854775808,
            uint64: 18446744073709551615,
        };
    }
}
