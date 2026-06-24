contract DifferentOptDefaults {
    foo: Int? = 5;
    bar: Bool? = null;
    baz: String? = "abc";

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
    }
}