contract IntVariants {
    a: Int;
    b: Int as uint32;
    c: Int as int64;
    d: Int as coins;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = -5;
        self.d = ton("1");
    }
}