contract OptionalMix {
    foo: Int?;
    bar: String?;
    baz: Bool?;

    init() {
        self.foo = 123;
        self.bar = null;
        self.baz = true;
    }
}