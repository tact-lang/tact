contract ChainAssign {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;

    init() {
        self.a = 1;
        self.b = self.a + 1;
        self.c = self.b + 1;
        self.d = self.c == 3;
    }
}