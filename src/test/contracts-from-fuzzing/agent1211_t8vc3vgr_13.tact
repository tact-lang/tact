struct SerializationFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
}

contract SerializedFields {
    s: SerializationFormats;
    init() {
        self.s = SerializationFormats{
            a: 5,
            b: -300,
            c: 1000000,
            d: 123456789,
        };
    }
}