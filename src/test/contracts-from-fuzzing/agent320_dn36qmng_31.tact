contract OptionalDefaults {
    foo: Int?;
    bar: String?;
    baz: Bool?;

    init() {
        self.foo = 1;
        self.bar = null;
        self.baz = true;
    }
}