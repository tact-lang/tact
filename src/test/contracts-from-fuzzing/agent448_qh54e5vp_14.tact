contract FieldsWithSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;

    init() {
        self.a = -12345678;
        self.b = 12345678;
        self.c = ton("1.5");
    }
}