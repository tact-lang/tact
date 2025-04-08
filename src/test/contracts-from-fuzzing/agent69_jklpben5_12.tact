struct CellAndSlice {
    cellVal: Cell;
    sliceVal: Slice;
}

contract CellSliceTest {
    v: CellAndSlice;

    init() {
        self.v = CellAndSlice{
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}