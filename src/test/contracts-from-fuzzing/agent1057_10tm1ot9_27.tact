contract InitDefaults {
    foo: Int = 10;
    bar: Bool;
    baz: String?;

    init() {
        self.foo = 20;
        self.bar = true;
        self.baz = null;
    }
}