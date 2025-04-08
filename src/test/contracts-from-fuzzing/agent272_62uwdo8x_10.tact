contract TestSerializeOrder {
    a: Int as uint8 = 1;
    b: Int as int64 = -5;
    c: Int as uint4 = 8;
    d: Int = 123;

    init() {
        self.a = 255;
        self.b = -64;
        self.c = 15;
        self.d = 456;
    }
}