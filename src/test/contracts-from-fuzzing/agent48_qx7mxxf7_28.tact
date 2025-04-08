contract OnlyOptionals {
    foo: Int?;
    bar: String?;
    baz: Bool?;
    qux: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
    }
}
