contract OptionalSerializationFormats {
    a: Int? as uint8;
    b: Int? as int64;
    c: Int? as uint64;
    d: Int? as coins;

    init() {
        self.a = 2;
        self.b = -2;
        self.c = 3;
        self.d = ton("1");
    }
}