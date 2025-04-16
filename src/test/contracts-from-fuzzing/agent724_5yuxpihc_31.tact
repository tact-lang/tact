contract ChainDefaults {
    a: Int = 1;
    b: Int;

    init() {
        self.b = self.a + 1;
    }
}