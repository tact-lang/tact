contract CellSliceStr {
    c: Cell;
    s: Slice;
    t: String;

    init() {
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.t = "hi";
    }
}