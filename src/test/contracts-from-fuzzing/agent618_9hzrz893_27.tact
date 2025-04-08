contract OptionalDefaults {
    foo: Int? = null;
    bar: Bool? = true;

    init() {
        self.foo = 5;
        self.bar = null;
    }
}