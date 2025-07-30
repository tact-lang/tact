contract EmptyDefaults {
    foo: String?;
    bar: Int?;
    baz: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}