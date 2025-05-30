contract OptionalSerialization {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int?;

    init() {
        self.a = null;
        self.b = -123;
        self.c = 42;
    }
}