contract SerializationVariants {
    a: Int as int8;
    b: Int as uint4;
    c: Int as coins;
    d: Int as uint32;
    e: Int as int16;
    f: Bool;

    init() {
        self.a = 7;
        self.b = 15;
        self.c = 1000000;
        self.d = 123456;
        self.e = -1234;
        self.f = true;
    }
}
