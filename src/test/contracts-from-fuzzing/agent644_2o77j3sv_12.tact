struct SerializeFormats {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
}

contract SerializeTest {
    vals: SerializeFormats;

    init() {
        self.vals = SerializeFormats{
            a: 12,
            b: -12,
            c: 1234,
            d: -1234,
            e: 123456,
            f: -123456
        };
    }
}