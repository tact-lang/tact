struct HasCell {
    c: Cell;
}

struct HasSlice {
    s: Slice;
}

contract MixCellSlice {
    cellField: HasCell;
    sliceField: HasSlice;

    init() {
        self.cellField = HasCell{ c: emptyCell() };
        self.sliceField = HasSlice{ s: emptyCell().asSlice() };
    }
}