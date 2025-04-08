contract OptionalFieldsDirect {
    foo: Int?;
    bar: Bool?;
    baz: Address?;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
    }
}