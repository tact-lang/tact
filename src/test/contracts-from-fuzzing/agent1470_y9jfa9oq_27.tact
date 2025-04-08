contract ChainedAssign {
    a: Int;
    b: Int;
    c: Int;

    init() {
        self.a = 1;
        self.b = self.a + 10;
        self.c = self.b + 10;
    }
}