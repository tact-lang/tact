contract OptionalFieldsAndDefaults {
    foo: Int?;
    bar: String = "bar";
    baz: Bool?;

    init() {
        self.foo = null;
        self.baz = true;
    }
}