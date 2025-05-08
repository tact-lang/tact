struct SliceCell {
    s: Slice;
    c: Cell;
}

contract SliceCellPersist {
    data: SliceCell;

    init() {
        self.data = SliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}