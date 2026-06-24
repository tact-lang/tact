contract LongInitChain {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;

    init() {
        self.a = 1;
        self.b = self.a + 1;
        self.c = self.b + 1;
        self.d = self.c + 1;
        self.e = self.d + 1;
    }
}