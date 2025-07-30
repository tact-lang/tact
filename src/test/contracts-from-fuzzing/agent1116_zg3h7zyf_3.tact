contract TestContract {
    foo: Int = 12345;
    bar: Bool = false;
    corge: String = "Hello";
    baz: Address; // uninitialized, must be set in init()
    qux: Cell;     // uninitialized
    quux: Slice;   // uninitialized

    init() {
        self.baz = myAddress();
        self.qux = emptyCell();
        self.quux = emptyCell().asSlice();
    }
}