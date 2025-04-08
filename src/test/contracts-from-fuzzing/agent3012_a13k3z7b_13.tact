contract OptionalWithDefaults {
    foo: Int? = null;
    bar: String? = null;
    baz: Bool? = null;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}