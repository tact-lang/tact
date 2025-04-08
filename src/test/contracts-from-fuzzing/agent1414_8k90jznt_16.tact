struct SerializedMix {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;
}

contract SerializedStructTest {
    data: SerializedMix;

    init() {
        self.data = SerializedMix {
            a: 200,
            b: -32000,
            c: 12345678,
            d: -123456789,
            e: 12345678901234567890,
            f: -1
        };
    }
}