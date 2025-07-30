struct OptionalSerializationFormats {
    a: Int? as uint8;
    b: Int? as int64;
    c: Int? as uint32;
    d: Int? as int257;
}

contract OptionalSerializationFormatsTest {
    f: OptionalSerializationFormats;

    init() {
        self.f = OptionalSerializationFormats{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}