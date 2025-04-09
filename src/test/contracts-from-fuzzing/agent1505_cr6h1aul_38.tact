contract IntSerializeVariants {
    a: Int as int257;
    b: Int as int64;
    c: Int as uint4;
    d: Int as coins;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = ton("1");
    }
}