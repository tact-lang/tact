struct WrapSliceCell {
    slice: Slice;
    cell: Cell;
    optSlice: Slice?;
    optCell: Cell?;
}

contract SliceCellTest {
    val: WrapSliceCell;

    init() {
        self.val = WrapSliceCell{
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            optSlice: null,
            optCell: null
        };
    }
}
