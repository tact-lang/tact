contract NullableSerializations {
    a: Int? as int64;
    b: Int? as uint64;
    c: Int? as coins;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
