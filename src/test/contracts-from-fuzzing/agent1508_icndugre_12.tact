struct CellSer {
    cellField: Cell;
    sliceField: Slice;
}

contract CellFields {
    data: CellSer;

    init() {
        self.data = CellSer{
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
        };
    }
}
