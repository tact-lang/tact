contract ComplexSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Bool;

    init() {
        self.a = 42;
        self.b = -123456789;
        self.c = true;
    }
}