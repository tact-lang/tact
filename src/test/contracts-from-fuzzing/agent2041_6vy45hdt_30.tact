contract OptionalAndPlain {
    foo: Int = 0;
    bar: Int? = null;
    baz: Bool = false;
    qux: Bool? = null;
    init() {
        self.foo = 10;
        self.bar = 20;
        self.baz = true;
        self.qux = false;
    }
}