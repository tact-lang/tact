contract OptionalPrimitive {
    foo: Int?;
    bar: String?;
    baz: Bool?;
    addr: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.addr = null;
    }
}
