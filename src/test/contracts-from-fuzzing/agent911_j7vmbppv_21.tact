contract OptionalDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}