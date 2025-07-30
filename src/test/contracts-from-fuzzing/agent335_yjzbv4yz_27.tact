struct SliceCell {
    s: Slice;
    c: Cell;
}

contract SliceCellFields {
    field: SliceCell;

    init() {
        self.field = SliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell(),
        };
    }
}