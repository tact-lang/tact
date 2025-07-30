contract ChainDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int;

    init() {
        self.c = self.a + self.b;
    }
}