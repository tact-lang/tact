contract BigInts {
    a: Int as int256;
    b: Int as int255;
    c: Int as int200;
    d: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}
