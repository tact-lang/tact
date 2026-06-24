contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Address;
    quux: Cell;
    corge: Slice;
    grault: Builder;
    garply: Int?;
    waldo: Bool?;
    fred: String?;
    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "hi";
        self.qux = myAddress();
        self.quux = emptyCell();
        self.corge = emptyCell().asSlice();
        self.grault = beginCell();
        self.garply = null;
        self.waldo = null;
        self.fred = null;
    }
}