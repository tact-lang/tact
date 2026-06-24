contract OptionalFields {
    foo: Int? = null;
    bar: Bool? = null;
    baz: Address? = null;
    qux: String? = null;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.qux = "abc";
    }

    receive() {}
}