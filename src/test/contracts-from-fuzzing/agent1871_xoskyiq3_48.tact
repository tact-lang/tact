contract IntVariants {
    a: Int as uint16;
    b: Int as int64;
    c: Int;

    init() {
        self.a = 60000;
        self.b = -123;
        self.c = 789;
    }
}