contract Test {
    a: Int as int4;
    b: Int as int8;
    c: Int as uint12;
    d: Int as uint255;
    e: Int;
    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}