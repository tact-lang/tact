struct SliceAndCell {
    dataSlice: Slice;
    dataCell: Cell;
}

contract SlicesCells {
    sc: SliceAndCell;

    init() {
        let c = emptyCell();
        let s = c.asSlice();
        self.sc = SliceAndCell{ dataSlice: s, dataCell: c };
    }
}
