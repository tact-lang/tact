struct SliceWrap {
    slice: Slice;
}

struct CellWrap {
    cell: Cell;
}

contract CellsAndSlices {
    s: SliceWrap;
    c: CellWrap;

    init() {
        self.s = SliceWrap{ slice: emptyCell().asSlice() };
        self.c = CellWrap{ cell: emptyCell() };
    }
}