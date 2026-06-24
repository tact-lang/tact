contract InitOverrideDefaults {
    foo: Int = 1;
    bar: Bool = true;

    init() {
        self.foo = 100;
        self.bar = false;
    }
}