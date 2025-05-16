contract IntSizes {
    a: Int as int8;
    b: Int as uint64;
    c: Int as int257;

    init() {
        self.a = 1;
        self.b = 42;
        self.c = -5;
    }
}