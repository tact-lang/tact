contract TestContract {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: Cell?;
    corge: Slice?;
    grault: String?;

    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.qux = beginCell().endCell();
        self.corge = beginCell().endCell().asSlice();
        self.grault = "test";
    }

    receive() {}
}