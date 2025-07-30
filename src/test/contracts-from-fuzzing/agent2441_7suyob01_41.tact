struct CellOptStruct {
    c: Cell?;
    s: Slice?;
}

contract OptionalCellStruct {
    data: CellOptStruct?;

    init() {
        self.data = null;
    }
}