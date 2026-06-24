struct HasSliceCell {
    s: Slice;
    c: Cell;
}

contract SliceCellField {
    data: HasSliceCell;

    init() {
        self.data = HasSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell(),
        };
    }
}