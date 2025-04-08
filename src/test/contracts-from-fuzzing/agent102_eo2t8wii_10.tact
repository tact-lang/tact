struct SerStruct {
    u8: Int as uint8;
    i64: Int as int64;
    u256: Int as uint256;
}

contract StructSerializationTest {
    s: SerStruct;

    init() {
        self.s = SerStruct{
            u8: 255,
            i64: -12345678,
            u256: 1234567890123456789
        };
    }
}