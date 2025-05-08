contract OptionalsWithDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;

    init() {
        self.foo = 42;
        self.bar = true;
        self.baz = "Hi";
    }
}