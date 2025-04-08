contract SerializedFields {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;

    init() {
        self.a = -42;
        self.b = 123456;
        self.c = ton("1");
    }
}