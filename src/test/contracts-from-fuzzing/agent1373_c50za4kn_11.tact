contract Test {
    foo: Int?;
    bar: Bool;
    baz: Address?;
    qux: Cell;
    quux: Slice?;
    corge: String;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
        self.qux = emptyCell();
        self.quux = null;
        self.corge = "hello";
    }
}