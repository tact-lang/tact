contract OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
    }
}