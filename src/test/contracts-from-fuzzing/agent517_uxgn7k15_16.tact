contract ChainOptionInitializer {
    foo: Int?;
    bar: Int?;

    init() {
        self.foo = 42;
        self.foo = null;
        self.bar = null;
        self.bar = 99;
    }
}