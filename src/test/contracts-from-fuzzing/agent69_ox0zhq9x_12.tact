contract OptionalFieldsBasic {
    foo: Int?;
    bar: Bool?;
    baz: String?;

    init() {
        self.foo = 42;
        self.bar = null;
        self.baz = "hello";
    }
}
