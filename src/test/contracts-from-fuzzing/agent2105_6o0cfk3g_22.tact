struct SerializationHints {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int;
}

contract TestContract {
    s: SerializationHints;

    init() {
        self.s = SerializationHints{
            a:255,
            b:-32000,
            c:65000,
            d:12345678,
        };
    }
}