struct SerializeFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;
}

contract SerializeFormatsTest {
    data: SerializeFormats;

    init() {
        self.data = SerializeFormats{
            a: 1,
            b: -1234,
            c: 42,
            d: -9876543210,
            e: 123456789012345678901234567890,
            f: -1
        };
    }
}