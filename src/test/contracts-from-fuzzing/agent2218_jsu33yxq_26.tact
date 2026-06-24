contract Test {
    s: Slice;
    c: Cell;
    sOpt: Slice?;
    cOpt: Cell?;

    init() {
        self.s = emptyCell().asSlice();
        self.c = emptyCell();
        self.sOpt = null;
        self.cOpt = null;
    }
}