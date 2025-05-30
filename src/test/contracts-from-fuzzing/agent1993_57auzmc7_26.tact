contract OptionalChain {
    foo: Int?;
    bar: String?;

    init() {
        self.foo = 1;
        self.bar = null;
    }
}