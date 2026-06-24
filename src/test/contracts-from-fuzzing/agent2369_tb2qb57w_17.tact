contract OptionalStorage {
    foo: Int?;
    bar: Bool?;
    baz: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}