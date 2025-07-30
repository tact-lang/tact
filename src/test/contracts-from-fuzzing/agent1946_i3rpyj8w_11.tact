contract Test {
    a: Int = 0;
    b: Bool = false;
    c: Address? = null;
    d: Cell;
    e: Slice;
    f: String = "";

    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}
