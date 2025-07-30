contract OptAndDefaults {
    foo: Int = 10;
    bar: Bool?;
    baz: String?;

    init() {
        self.bar = null;
        self.baz = null;
    }
}