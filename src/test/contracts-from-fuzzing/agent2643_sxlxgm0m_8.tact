struct IntSerialization {
    bigInt: Int;
    int8: Int as int8;
    uint8: Int as uint8;
    int16: Int as int16;
    uint16: Int as uint16;
    int32: Int as int32;
}

contract IntSerialTest {
    data: IntSerialization;

    init() {
        self.data = IntSerialization{
            bigInt: 123456,
            int8: -8,
            uint8: 255,
            int16: -12345,
            uint16: 65535,
            int32: -1000000
        };
    }
}
