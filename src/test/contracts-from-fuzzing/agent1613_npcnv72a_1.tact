contract Test {
    foo: Bool;
    bar: Int;
    baz: String;
    qux: Slice;
    quux: Cell;
    corge: Address;
    grault: Bool?;
    garply: String?;
    waldo: Slice?;
    fred: Cell?;
    plugh: Address?;

    init() {
        self.foo = true;
        self.bar = 42;
        self.baz = "hello";
        self.qux = emptyCell().asSlice();
        self.quux = emptyCell();
        self.corge = myAddress();
        self.grault = false;
        self.garply = null;
        self.waldo = null;
        self.fred = null;
        self.plugh = null;
    }
}
