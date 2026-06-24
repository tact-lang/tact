contract OptionalSerialize {
    a: Int? as uint8;
    b: Int? as int64;
    c: Int? as coins;

    init() {
        self.a = 42;
        self.b = null;
        self.c = 1000;
    }
}