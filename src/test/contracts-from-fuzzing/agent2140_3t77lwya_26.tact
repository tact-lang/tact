contract OptionalFields {
    foo: Int?;
    bar: Bool?;
    name: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.name = null;
    }
}
