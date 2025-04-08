contract JustOptionals {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: String?;
    quux: Slice?;
    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.quux = null;
    }
}