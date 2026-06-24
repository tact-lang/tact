contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;
    quux: Slice;
    corge: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = emptyCell().asSlice();
        self.corge = "test";
    }

    receive() {
        self.foo = 2;
    }
}