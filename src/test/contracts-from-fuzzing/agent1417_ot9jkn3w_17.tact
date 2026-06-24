struct CellHolder {
    cellData: Cell;
    sliceData: Slice;
}

contract CellPtrs {
    storage: CellHolder;

    init() {
        self.storage = CellHolder{
            cellData: emptyCell(),
            sliceData: emptyCell().asSlice()
        };
    }
}