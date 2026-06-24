contract IntSerializations {
    a: Int as int64;
    b: Int as uint8;
    c: Int;
    init() {
        self.a = 12345678;
        self.b = 255;
        self.c = -42;
    }
}