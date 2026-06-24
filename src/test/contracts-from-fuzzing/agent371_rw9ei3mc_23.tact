struct HasSliceCell {
    s: Slice;
    c: Cell;
}

contract SliceCellFields {
    x: HasSliceCell;

    init() {
        self.x = HasSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}