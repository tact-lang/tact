struct HasSliceAndCell {
    s: Slice;
    c: Cell;
}

contract SliceCellStructField {
    data: HasSliceAndCell;
    init() {
        self.data = HasSliceAndCell{ s: emptyCell().asSlice(), c: emptyCell() };
    }
}