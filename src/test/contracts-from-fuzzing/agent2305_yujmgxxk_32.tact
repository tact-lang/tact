contract OptionalDifferentSerializations {
    a: Int? as uint8;
    b: Int? as int64;
    c: Int? as coins;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
