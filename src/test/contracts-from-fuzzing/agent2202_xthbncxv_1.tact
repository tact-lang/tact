contract Test {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;
    quux: Slice;
    corge: String;
    grault: Int?;

    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = emptyCell().asSlice();
        self.corge = "hello";
        self.grault = null;
    }
}