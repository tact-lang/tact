contract OptionalPrimitives {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = 42;
        self.bar = true;
    }
}