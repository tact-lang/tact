contract Test {
    foo: Int = 1;
    bar: Bool = true;
    baz: Address;
    qux: Cell;
    qix: Slice;
    quux: String = "hello";
    corge: Int? = null;
    grault: String? = null;
    garply: Address? = null;
    waldo: Bool? = null;

    init() {
        self.baz = myAddress();
        self.qux = emptyCell();
        self.qix = emptyCell().asSlice();
    }
}