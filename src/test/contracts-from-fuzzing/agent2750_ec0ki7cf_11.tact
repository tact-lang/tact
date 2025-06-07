struct SliceAndCell {
    c: Cell;
    s: Slice;
    optC: Cell?;
    optS: Slice?;
}

contract SliceCellPersist {
    data: SliceAndCell;
    init() {
        self.data = SliceAndCell {
            c: emptyCell(),
            s: emptyCell().asSlice(),
            optC: null,
            optS: null
        };
    }
}
