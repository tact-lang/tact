struct SerializationFormats {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int257;
}

contract SerializationFormatsTest {
    f: SerializationFormats;

    init() {
        self.f = SerializationFormats{
            a: 5,
            b: -100,
            c: 3000,
            d: 123456789,
        };
    }
}