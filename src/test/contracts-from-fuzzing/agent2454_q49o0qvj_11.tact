struct SliceHolder {
    s: Slice;
}

struct CellHolder {
    c: Cell;
}

contract LowLevelTest {
    field1: SliceHolder;
    field2: CellHolder;

    init() {
        self.field1 = SliceHolder{ s: emptyCell().asSlice() };
        self.field2 = CellHolder{ c: emptyCell() };
    }
}