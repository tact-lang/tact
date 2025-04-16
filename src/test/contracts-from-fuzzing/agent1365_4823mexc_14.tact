contract InitDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "foo";
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.b = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}