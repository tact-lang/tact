contract IntSerialization {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint64;
    e: Int;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -1000;
        self.d = 123456789;
        self.e = 42;
    }
}