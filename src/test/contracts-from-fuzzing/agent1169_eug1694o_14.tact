contract ExplicitSerialization {
    a: Int as int8;
    b: Int as uint64;
    c: Int;

    init() {
        self.a = 5;
        self.b = 10;
        self.c = 15;
    }
}