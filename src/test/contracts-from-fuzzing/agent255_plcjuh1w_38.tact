struct HasSliceCell {
    sl: Slice;
    cl: Cell;
}

contract SliceCellTest {
    data: HasSliceCell;

    init() {
        self.data = HasSliceCell{ sl: emptyCell().asSlice(), cl: emptyCell() };
    }
}