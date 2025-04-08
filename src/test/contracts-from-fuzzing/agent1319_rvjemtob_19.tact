contract LargeOptionalPrimitive {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    quux: Cell?;
    quuz: Slice?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.quux = null;
        self.quuz = null;
    }
}