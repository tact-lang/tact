contract IntSizes {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int;

    init() {
        self.a = 255;
        self.b = -100;
        self.c = 65536;
        self.d = 42;
    }
}