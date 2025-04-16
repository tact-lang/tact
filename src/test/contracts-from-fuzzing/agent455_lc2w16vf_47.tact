contract OptionalFieldsDefaults {
    foo: Int? = 123;
    bar: String? = "abc";
    baz: Bool? = true;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}