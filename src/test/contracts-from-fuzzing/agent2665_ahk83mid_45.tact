struct HasSliceAndCell {
    s: Slice;
    c: Cell;
}

contract SliceCellCombo {
    data: HasSliceAndCell;

    init() {
        self.data = HasSliceAndCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}