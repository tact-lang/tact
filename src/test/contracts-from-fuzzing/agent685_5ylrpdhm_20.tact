struct SerializeTest {
    int8: Int as int8;
    uint8: Int as uint8;
    int16: Int as int16;
    uint16: Int as uint16;
    int32: Int as int32;
    uint32: Int as uint32;
}

contract SerializationFields {
    s: SerializeTest;

    init() {
        self.s = SerializeTest{
            int8: -5,
            uint8: 250,
            int16: -1234,
            uint16: 43210,
            int32: -12345678,
            uint32: 3000000000
        };
    }
}