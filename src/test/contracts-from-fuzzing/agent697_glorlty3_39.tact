contract OptionalIntWithSerialization {
    a: Int? as int8;
    b: Int? as uint32;

    init() {
        self.a = null;
        self.b = null;
    }
}