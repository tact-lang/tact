struct SliceCellMix {
    sliceVal: Slice;
    optSlice: Slice?;
    cellVal: Cell;
    optCell: Cell?;
}

contract SliceCellTest {
    data: SliceCellMix;

    init() {
        self.data = SliceCellMix{
            sliceVal: emptyCell().asSlice(),
            optSlice: null,
            cellVal: emptyCell(),
            optCell: null
        };
    }
}