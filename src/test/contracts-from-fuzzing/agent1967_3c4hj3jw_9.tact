contract TestContract {
    foo: String?;
    bar: Cell?;
    baz: Slice?;
    qux: Builder?;
    addr: Address?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.addr = null;
    }
}