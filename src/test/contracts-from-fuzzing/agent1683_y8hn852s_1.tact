contract TestPersistentFields {
    foo: Int = 7;
    bar: Bool = true;
    baz: Address;
    qux: Cell;
    quux: Slice;
    corge: String;

    init() {
        self.foo = 42;
        self.bar = false;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = emptyCell().asSlice();
        self.corge = "hello";
    }

    receive() {
        self.foo = 99;
    }
}