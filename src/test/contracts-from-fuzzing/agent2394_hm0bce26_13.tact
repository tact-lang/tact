contract SerializationVariants {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Int;

    init() {
        self.a = 7;
        self.b = -42;
        self.c = 1000;
        self.d = 999999999;
    }
}
