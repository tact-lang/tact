contract Test1 {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
    }
}