contract OptDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: Address? = null;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}