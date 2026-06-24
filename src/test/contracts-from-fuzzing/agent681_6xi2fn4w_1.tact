contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;
    quux: Slice;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = self.qux.asSlice();
    }
}
