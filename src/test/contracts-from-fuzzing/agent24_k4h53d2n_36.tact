contract IntsWithSerialization {
    a: Int as uint8;
    b: Int as int4;
    c: Int as coins;

    init() {
        self.a = 255;
        self.b = -8;
        self.c = 100;
    }
}