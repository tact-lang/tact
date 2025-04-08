contract OptionalInitTest {
    foo: Int?;
    bar: String?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}
