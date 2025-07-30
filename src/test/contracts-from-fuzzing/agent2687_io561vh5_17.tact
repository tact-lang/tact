struct InnerSliceCell {
    sc: Slice;
}

contract SliceCellTest {
    s: Slice;
    c: Cell;
    inner: InnerSliceCell;

    init() {
        self.s = emptyCell().asSlice();
        self.c = emptyCell();
        self.inner = InnerSliceCell{ sc: emptyCell().asSlice() };
    }
}