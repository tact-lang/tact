struct SliceStruct {
    s: Slice;
    so: Slice?;
}

struct CellStruct {
    c: Cell;
    co: Cell?;
}

contract TestContract {
    sliceField: SliceStruct;
    cellField: CellStruct;

    init() {
        self.sliceField = SliceStruct{s: emptyCell().asSlice(), so: null};
        self.cellField = CellStruct{c: emptyCell(), co: null};
    }
}