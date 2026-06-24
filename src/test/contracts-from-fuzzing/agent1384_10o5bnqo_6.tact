contract OptionalFieldsTest {
    foo: Int?;
    bar: Bool?;
    baz: String?;

    init() {
        self.foo = null;
        self.bar = false;
        self.baz = "hello";
    }
}