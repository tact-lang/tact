contract OptionalAddress {
    foo: Int = 10;
    bar: Address? = null;
    baz: Bool = true;

    init() {
        self.foo = 20;
        self.bar = null;
        self.baz = false;
    }
}