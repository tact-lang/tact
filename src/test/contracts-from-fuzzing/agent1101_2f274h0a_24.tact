contract OptionalDefaults {
    foo: Int? = null;
    bar: Bool? = true;
    baz: String? = "abc";

    init() {
        self.foo = 5;
        self.bar = null;
        self.baz = null;
    }
}