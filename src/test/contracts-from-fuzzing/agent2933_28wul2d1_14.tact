contract SerialFormats {
    a: Int as uint8;
    b: Int as int32;
    c: Int as int64;
    d: Int as coins;

    init() {
        self.a = 7;
        self.b = -1234;
        self.c = 123456789;
        self.d = ton("0.5");
    }
}