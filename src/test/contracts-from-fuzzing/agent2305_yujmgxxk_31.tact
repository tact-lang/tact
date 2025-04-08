contract DifferentSerializations {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;

    init() {
        self.a = 255;
        self.b = -123456789;
        self.c = 1000000000;
    }
}
