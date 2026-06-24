contract InitDefaults {
    foo: Int;
    bar: Bool;
    baz: Bool?;
    qux: Address?;

    init() {
        self.foo = 100;
        self.bar = true;
        self.baz = null;
        self.qux = null;
    }
}