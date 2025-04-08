struct CellSlice {
    cellVal: Cell;
    sliceVal: Slice;
}

contract CellSliceHolder {
    stuff: CellSlice;

    init() {
        self.stuff = CellSlice{
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}
