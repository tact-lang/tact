contract OptionalPrimitives {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: Cell?;
    s: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.s = null;
    }
}