struct HasSliceAndCell {
    s: Slice;
    c: Cell;
}

contract SliceAndCellFields {
    data: HasSliceAndCell;

    init() {
        let tmp = emptyCell();
        self.data = HasSliceAndCell{ s: tmp.asSlice(), c: tmp };
    }
}