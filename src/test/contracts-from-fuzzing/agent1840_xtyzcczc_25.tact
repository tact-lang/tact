struct CellSlice {
    c: Cell;
    s: Slice;
}

contract CellInner {
    inner: CellSlice;
    init() {
        self.inner = CellSlice{ c: emptyCell(), s: emptyCell().asSlice() };
    }
}