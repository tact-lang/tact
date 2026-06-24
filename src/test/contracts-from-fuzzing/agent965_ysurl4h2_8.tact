contract OptionalPrimitives {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: String?;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
        self.qux = "hello";
    }
}