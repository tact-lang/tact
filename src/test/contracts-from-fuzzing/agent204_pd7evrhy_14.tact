contract ComplexSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint250;
    d: Int;
    e: Bool;

    init() {
        self.a = 1;
        self.b = -100;
        self.c = 9999999;
        self.d = 42;
        self.e = true;
    }

    receive() {
        self.a = (self.a + 1) % 256;
        self.b -= 1;
        self.c += 1;
        self.e = !self.e;
    }
}