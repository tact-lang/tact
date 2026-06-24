contract OptionalDefaultNull {
    foo: Int? = null;
    bar: String? = null;
    baz: Bool? = null;
    addr: Address? = null;

    init() {
        self.foo = 42;
        self.bar = "Hello";
        self.baz = true;
        self.addr = myAddress();
    }
}