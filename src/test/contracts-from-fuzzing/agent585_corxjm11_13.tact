contract OptionalDirect {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = 123;
        self.bar = null;
    }
}
