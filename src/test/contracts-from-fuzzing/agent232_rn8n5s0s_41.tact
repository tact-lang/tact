contract TestInvalidDefault {
    test: String = "hello";
    foo: Int? = null;

    init() {
        self.foo = null;
    }
}