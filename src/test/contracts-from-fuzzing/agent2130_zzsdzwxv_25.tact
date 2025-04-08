contract Test {
    foo: String? = null;

    init() {
        self.foo = null;
        self.foo = "test";
    }
}