contract OptionalFields {
    foo: Int?;
    bar: String?;
    baz: Cell?;

    init() {
        self.foo = null;
        self.bar = "present";
        self.baz = null;
    }
}