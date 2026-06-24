struct WithSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract FieldsWithSerialization {
    s: WithSerialization;

    init() {
        self.s = WithSerialization{ a: 255, b: -1234, c: 65535 };
    }
}
