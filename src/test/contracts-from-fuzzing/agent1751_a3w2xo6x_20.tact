struct SerialMixed {
    v8: Int as uint8;
    v16: Int as int16;
    v51: Int as uint51;
    v64: Int as uint64;
    v120: Int as coins;
    v256: Int as uint256;
}

contract SerializationMixTest {
    data: SerialMixed;

    init() {
        self.data = SerialMixed{
            v8:250,
            v16:-32000,
            v51:1234567,
            v64:9876543210,
            v120:ton("1"),
            v256:1234567890123456789,
        };
    }
}
