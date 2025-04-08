contract OptNullDefaults {
    foo: Int?;
    bar: Int? = null;
    baz: String?;

    init() {
        self.foo = null;
        self.bar = 42;
        self.baz = null;
    }
}