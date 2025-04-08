struct CellHolder {
    c: Cell;
}

struct SliceHolder {
    s: Slice;
}

contract CellAndSliceFields {
    f1: CellHolder;
    f2: SliceHolder;

    init() {
        self.f1 = CellHolder{ c: emptyCell() };
        self.f2 = SliceHolder{ s: emptyCell().asSlice() };
    }
}
