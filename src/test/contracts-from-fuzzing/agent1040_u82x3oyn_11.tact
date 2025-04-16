struct SerializeFormats {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
}

contract SerializeFormatTest {
    data: SerializeFormats;

    init() {
        self.data = SerializeFormats{
            a: -5,
            b: 255,
            c: -100000,
            d: 123456789,
        };
    }
}