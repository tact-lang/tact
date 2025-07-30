struct HasSliceCell {
    s: Slice;
    c: Cell;
}

contract SliceAndCell {
    store: HasSliceCell;
    init() {
        self.store = HasSliceCell{ s: emptyCell().asSlice(), c: emptyCell() };
    }
}