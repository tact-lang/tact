contract NumericVariants {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint64;
    e: Int as int257;

    init() {
        self.a = -5;
        self.b = 5;
        self.c = -5000;
        self.d = 5000;
        self.e = 123456;
    }
}