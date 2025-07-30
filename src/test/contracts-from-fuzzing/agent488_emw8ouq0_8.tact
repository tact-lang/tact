contract OptionalFieldsOnly {
    foo: Int?;
    bar: Bool?;
    baz: Cell?;
    qux: String?;
    quux: Address?;
    corge: Slice?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.quux = null;
        self.corge = null;
    }
}