contract Test {
    a: Int = 1;
    b: Bool = false;
    c: Slice;
    d: Cell;
    e: Address;

    init() {
        self.c = emptyCell().asSlice();
        self.d = emptyCell();
        self.e = myAddress();
    }
}