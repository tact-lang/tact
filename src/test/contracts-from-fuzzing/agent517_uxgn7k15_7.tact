contract OptionalFieldsTest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    addr: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = "hello";
        self.addr = null;
    }
}