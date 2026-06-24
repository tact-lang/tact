contract SerialOrderTest {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint248;
    d: Int as int248;

    init() {
        self.a = 10;
        self.b = -3;
        self.c = 42;
        self.d = -42;
    }
}