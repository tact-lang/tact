contract ManyOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Cell?;
    quux: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.quux = null;
    }
}