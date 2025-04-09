struct NestedWithSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
}

contract SerializationFields {
    data: NestedWithSerialization;
    init() {
        self.data = NestedWithSerialization{ a: 12, b: -120, c: true};
    }
}