struct HasSliceAndCell {
    s: Slice;
    c: Cell;
}

contract SliceCellStorage {
    data: HasSliceAndCell;

    init() {
        self.data = HasSliceAndCell {
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}