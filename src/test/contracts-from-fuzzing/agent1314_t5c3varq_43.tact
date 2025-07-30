contract NullInFields {
    foo: Int?;
    bar: Int?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}