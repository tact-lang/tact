contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: Cell;
    quux: Slice;
    corge: String;
    grault: Int?;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = self.qux.asSlice();
        self.corge = "test";
        self.grault = null;
    }
}