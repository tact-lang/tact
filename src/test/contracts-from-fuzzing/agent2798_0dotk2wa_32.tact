contract OptionalDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;

    init() {
        self.foo = 123;
        self.bar = true;
        self.baz = "new";
    }
}