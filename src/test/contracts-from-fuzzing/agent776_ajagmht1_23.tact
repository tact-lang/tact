struct SliceCell {
    sliceField: Slice;
    cellField: Cell;
}

contract SliceCellTest {
    data: SliceCell;
    init() {
        self.data = SliceCell{
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell()
        };
    }
}