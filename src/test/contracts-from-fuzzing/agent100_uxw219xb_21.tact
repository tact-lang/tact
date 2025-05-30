contract ChainDefaults {
    a: Int = 5;
    b: Int = 10;
    c: Int;

    init() {
        self.c = self.a + self.b;
    }
}