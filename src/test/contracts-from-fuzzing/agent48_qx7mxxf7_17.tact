struct HasSliceCell {
    s: Slice;
    c: Cell;
}

contract SliceCellTest {
    item: HasSliceCell;

    init() {
        self.item = HasSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}
