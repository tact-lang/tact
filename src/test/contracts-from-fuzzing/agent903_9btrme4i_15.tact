contract ManyOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Address?;
    quux: Cell?;
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