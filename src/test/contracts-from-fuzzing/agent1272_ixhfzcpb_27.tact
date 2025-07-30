struct HasSliceAndCell {
    s: Slice;
    c: Cell;
}

contract SliceCellFields {
    d: HasSliceAndCell;
    init() {
        self.d = HasSliceAndCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}
