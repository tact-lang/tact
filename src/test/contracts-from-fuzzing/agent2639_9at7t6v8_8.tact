contract ExplicitSerialization {
    a: Int as int64;
    b: Int as uint64;
    c: Int as uint8;
    d: Int;

    init() {
        self.a = 123;
        self.b = 456;
        self.c = 7;
        self.d = 999;
    }
}