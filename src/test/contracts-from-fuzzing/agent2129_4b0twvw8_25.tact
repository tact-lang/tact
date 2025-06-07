contract ComplexSerialization {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
    d: Int as int256;
    e: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}