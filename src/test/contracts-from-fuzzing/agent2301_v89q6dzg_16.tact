struct FieldsWithSerialization {
    a: Int as uint8;
    b: Int as int4;
    c: Int as uint16;
    d: Int as int64;
}

contract SerializationVars {
    data: FieldsWithSerialization;

    init() {
        self.data = FieldsWithSerialization{
            a: 255, b: 7, c: 65535, d: 1000000
        };
    }
}