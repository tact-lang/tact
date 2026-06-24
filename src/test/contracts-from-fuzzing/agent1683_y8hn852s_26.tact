struct HasCell {
    cl: Cell;
}

struct HasSlice {
    sl: Slice;
}

contract CellAndSlice {
    cfield: HasCell;
    sfield: HasSlice;

    init() {
        self.cfield = HasCell{ cl: emptyCell() };
        self.sfield = HasSlice{ sl: emptyCell().asSlice() };
    }

    receive() {
        self.cfield = HasCell{ cl: emptyCell() };
        self.sfield = HasSlice{ sl: emptyCell().asSlice() };
    }
}