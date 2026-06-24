contract ExplicitSerialize {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
    d: Int as int257;

    init() {
        self.a = 5;
        self.b = 500;
        self.c = -99;
        self.d = 123456;
    }
}