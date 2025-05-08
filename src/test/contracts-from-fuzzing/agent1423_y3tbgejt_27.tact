struct CellSlice {
    cellVal: Cell;
    sl: Slice;
}

contract CellSliceStorage {
    s: CellSlice;
    init() {
        self.s = CellSlice{
            cellVal: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}