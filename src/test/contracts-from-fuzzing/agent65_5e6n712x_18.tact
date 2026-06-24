contract OptionalsWithDefaults {
    foo: Int? = null;
    bar: Bool? = null;

    init() {
        self.foo = 42;
        self.bar = true;
    }
}
