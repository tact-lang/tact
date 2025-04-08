contract TestContract {
    foo: Int?;
    bar: Bool = true;
    baz: String?;
    qux: Int = -1;

    init() {
        self.foo = null;
        self.baz = null;
    }

    receive() {
        self.foo; self.bar; self.baz; self.qux;
    }
}