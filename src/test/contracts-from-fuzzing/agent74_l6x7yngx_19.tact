struct HaveSlice {
    s: Slice;
}

struct HaveCell {
    c: Cell;
}

contract CellsStorage {
    slices: HaveSlice;
    cells: HaveCell;

    init() {
        self.slices = HaveSlice{ s: emptyCell().asSlice() };
        self.cells = HaveCell{ c: emptyCell() };
    }
}