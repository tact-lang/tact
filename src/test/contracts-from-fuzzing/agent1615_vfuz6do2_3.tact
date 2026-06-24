contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    baz: Address;
    qux: Cell;
    quux: Slice;
    corge: String = "hello";

    init() {
        self.foo = 42;
        self.bar = false;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = emptyCell().asSlice();
        self.corge = "world";
    }

    receive() {}
}