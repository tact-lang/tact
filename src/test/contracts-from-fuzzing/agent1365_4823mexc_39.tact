contract ChainedDefaults {
    a: Int = 2;
    b: Int = 2 + 2;
    c: Int = 2 + 2 + 2;
    d: Int;

    init() {
        self.d = self.a + self.b + self.c;
    }
}