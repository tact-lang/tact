contract CellSliceFields {
    c: Cell;
    s: Slice;
    oc: Cell?;
    os: Slice?;

    init() {
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.oc = null;
        self.os = null;
    }
}