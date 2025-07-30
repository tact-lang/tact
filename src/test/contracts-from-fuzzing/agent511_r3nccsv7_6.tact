contract OptionalFieldsContract {
    foo: Int?;
    bar: String?;
    baz: Bool?;

    init() {
        self.foo = null;
        self.bar = "hello";
        self.baz = null;
    }
}