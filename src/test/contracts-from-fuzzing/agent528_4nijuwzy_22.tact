contract OptionalSerializationSizes {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int? as uint64;

    init() {
        self.a = null;
        self.b = 123;
        self.c = null;
    }
}
