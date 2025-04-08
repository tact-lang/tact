contract OptionalFields {
    foo: Int?;
    bar: Address?;
    baz: String?;

    init() {
        self.foo = 10;
        self.bar = null;
        self.baz = "test";
    }
}