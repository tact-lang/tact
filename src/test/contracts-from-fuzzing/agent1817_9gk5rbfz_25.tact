struct SliceCell {
    s: Slice;
    c: Cell;
}

contract SliceAndCellTest {
    v: SliceCell;

    init() {
        self.v = SliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell(),
        };
    }
}
