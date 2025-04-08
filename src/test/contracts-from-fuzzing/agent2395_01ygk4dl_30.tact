struct HasSliceCell {
    s: Slice;
    c: Cell;
}

contract SliceCellTest {
    v: HasSliceCell;

    init() {
        self.v = HasSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}
