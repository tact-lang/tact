contract OptionalSerializationFields {
    a: Int? as uint8;
    b: Int? as int8;

    init() {
        self.a = null;
        self.b = null;
    }
}