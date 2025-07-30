struct CellHolder {
    c: Cell;
}

contract CellInStruct {
    f: CellHolder;

    init() {
        self.f = CellHolder{ c: emptyCell() };
    }
}