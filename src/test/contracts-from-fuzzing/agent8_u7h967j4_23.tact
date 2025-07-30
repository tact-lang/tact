contract OptionalBoolDefaults {
    foo: Bool? = null;
    bar: Bool? = false;

    init() {
        self.foo = true;
        self.bar = null;
    }
}