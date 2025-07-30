contract OptionalInitDefaults {
    foo: Int? = null;
    bar: Bool? = true;

    init() {
        self.foo = null;
        self.bar = false;
    }
}