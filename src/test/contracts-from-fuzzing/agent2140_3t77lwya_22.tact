contract SerializeVariants {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as int64;
    e: Int as uint128;

    init() {
        self.a = 7;
        self.b = 255;
        self.c = -100;
        self.d = 12345678;
        self.e = 7890123456;
    }
}
