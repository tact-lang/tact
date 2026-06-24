contract OptionalDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
    addr: Address? = null;

    init() {
        self.foo = 42;
        self.bar = true;
        self.baz = "ok";
        self.addr = myAddress();
    }
}