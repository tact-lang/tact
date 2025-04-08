struct StructWithSliceAndCell {
    dataSlice: Slice;
    dataCell: Cell;
}

contract SliceCellStorage {
    inner: StructWithSliceAndCell;

    init() {
        self.inner = StructWithSliceAndCell{
            dataSlice: "somedata".asComment().asSlice(),
            dataCell: emptyCell(),
        };
    }
}
