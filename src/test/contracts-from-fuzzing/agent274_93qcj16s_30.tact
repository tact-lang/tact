struct SerialFormats {
    a: Int as int32;
    b: Int as uint16;
    c: Int as uint1;
}

contract SerializationFormatsTest {
    data: SerialFormats;

    init() {
        self.data = SerialFormats{
            a: -1000,
            b: 65535,
            c: 1,
        };
    }
}