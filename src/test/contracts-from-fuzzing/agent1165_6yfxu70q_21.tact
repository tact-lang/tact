struct CellSlice {
    c: Cell;
    s: Slice;
}

contract CellSliceTest {
    x: CellSlice;

    init() {
        self.x = CellSlice{ c: emptyCell(), s: emptyCell().asSlice() };
    }
}
