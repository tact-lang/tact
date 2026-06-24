struct CellFieldStruct {
    cellField: Cell;
}

contract CellPersistent {
    f: CellFieldStruct;
    init() {
        self.f = CellFieldStruct { cellField: emptyCell() };
    }
}