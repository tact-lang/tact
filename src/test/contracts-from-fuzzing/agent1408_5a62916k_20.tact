contract OptionalsSerialization {
    a: Int? as uint32;
    b: Bool?;
    c: Int? as int16;

    init() {
        self.a = 12345;
        self.b = null;
        self.c = -123;
    }
}