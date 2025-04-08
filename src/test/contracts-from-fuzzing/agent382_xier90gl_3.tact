contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    baz: Address;
    qux: Cell;
    corge: Slice;
    grault: String = "hello";

    init() {
        self.baz = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.qux = beginCell().endCell();
        self.corge = beginCell().endCell().asSlice();
        self.grault = "world";
        self.foo = 42;
        self.bar = false;
    }

    receive() {}
}