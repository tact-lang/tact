contract TestContract {
    foo: Int as uint4;
    bar: Bool;
    baz: Address;
    qux: Cell;
    quux: Slice;
    corge: String;
    grault: Int;
    garply: Bool;
    waldo: Slice;
    fred: Cell;
    xyzzy: String;
    thud: Address;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = emptyCell().asSlice();
        self.corge = "hi";
        self.grault = 42;
        self.garply = false;
        self.waldo = emptyCell().asSlice();
        self.fred = emptyCell();
        self.xyzzy = "test";
        self.thud = myAddress();
    }
}