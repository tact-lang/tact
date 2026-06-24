contract IntSerializations {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;

    init() {
        self.a = -10;
        self.b = 12345;
        self.c = ton("1");
    }
}