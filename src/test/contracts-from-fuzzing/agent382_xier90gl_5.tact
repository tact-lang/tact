contract TestContract {
    foo: Int? = null;
    bar: Bool? = null;
    baz: Address? = null;
    qux: Cell? = null;
    corge: Slice? = null;
    grault: String? = null;

    init() {
        self.foo = 123;
        self.bar = false;
        self.baz = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.qux = beginCell().endCell();
        self.corge = beginCell().endCell().asSlice();
        self.grault = "set";
    }

    receive() {}
}