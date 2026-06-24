contract OptionalFieldDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;

    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = "hi";
    }
}