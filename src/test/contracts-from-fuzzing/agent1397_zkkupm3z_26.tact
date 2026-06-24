contract ManyPersistentOptionals {
    foo: Int?;
    bar: String?;
    baz: Bool?;
    qux: Int?;
    quux: String?;
    corge: Bool?;
    grault: Int?;
    garply: String?;

    init() {
        self.foo = null; self.bar = null; self.baz = null;
        self.qux = null; self.quux = null; self.corge = null;
        self.grault = null; self.garply = null;
    }
}