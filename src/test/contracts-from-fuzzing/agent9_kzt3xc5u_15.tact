struct CellAndSlice {
    cellVal: Cell;
    sliceVal: Slice;
}

contract CellSliceTest {
    store: CellAndSlice;

    init() {
        self.store = CellAndSlice{
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}