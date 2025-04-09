struct SerialHints {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
}

contract SerializationFields {
    s: SerialHints;

    init() {
        self.s = SerialHints{ a: 1, b: -2, c: 3 };
    }
}