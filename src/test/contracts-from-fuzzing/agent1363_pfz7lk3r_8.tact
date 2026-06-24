contract OnlyOptionals {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: Cell?;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
        self.qux = null;
    }
}