contract TestContract {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: Cell?;
    quux: Slice?;
    corge: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.quux = null;
        self.corge = null;
    }

    receive() {
        self.foo; self.bar; self.baz; self.qux; self.quux; self.corge;
    }
}