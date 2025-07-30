contract MixOptionalsPrimitives {
    foo: Int?;
    bar: Bool;
    baz: String?;
    qux: Address;
    quux: Cell;
    corge: Slice;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
        self.qux = myAddress();
        self.quux = emptyCell();
        self.corge = emptyCell().asSlice();
    }

    receive() {
        self.foo = 77;
        self.bar = false;
        self.baz = "hi";
    }
}