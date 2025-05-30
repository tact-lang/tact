contract OptionalPrimitives {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    addr: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.addr = null;
    }
}