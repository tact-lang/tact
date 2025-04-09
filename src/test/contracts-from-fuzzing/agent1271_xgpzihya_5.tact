contract OptsTest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = null;
    }
    receive() {}
}