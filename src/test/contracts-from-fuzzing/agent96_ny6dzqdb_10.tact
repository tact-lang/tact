contract Test {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Cell;
    e: Slice;
    f: Address;

    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}