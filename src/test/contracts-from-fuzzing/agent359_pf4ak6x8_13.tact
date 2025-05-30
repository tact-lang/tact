struct SliceStruct {
    s: Slice;
}

struct CellStruct {
    c: Cell;
}

contract SliceCellTest {
    x: SliceStruct;
    y: CellStruct;

    init() {
        self.x = SliceStruct{ s: emptyCell().asSlice() };
        self.y = CellStruct{ c: emptyCell() };
    }
}