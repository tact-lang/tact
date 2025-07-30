contract FourTypes {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;

    init() {
        self.foo = 1;
        self.bar = false;
        self.baz = myAddress();
        self.qux = emptyCell();
    }
}