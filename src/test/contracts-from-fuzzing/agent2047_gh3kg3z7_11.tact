contract DefaultOptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
    }
}