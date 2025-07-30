contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;
    quux: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = "test";
    }
}
