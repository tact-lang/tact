contract OnlyOptionals {
    foo: Int?;
    bar: String?;
    baz: Int?;
    qux: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
    }
}
