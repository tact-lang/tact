contract OptionalAndDefaults {
    foo: Int?;
    bar: String = "hello";
    baz: Bool?;

    init() {
        self.foo = null;
        self.baz = true;
    }
}
