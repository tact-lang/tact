contract Test {
    foo: Int;
    bar: Bool;
    baz: String;
    quux: Address;
    data: Cell;
    ref: Slice;
    init() {
        self.foo = 0;
        self.bar = false;
        self.baz = "";
        self.quux = myAddress();
        self.data = emptyCell();
        self.ref = emptyCell().asSlice();
    }
}