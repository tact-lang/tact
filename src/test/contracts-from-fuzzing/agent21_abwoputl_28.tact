struct CellHolder {
    c: Cell;
}

contract CellPersist {
    data: CellHolder;

    init() {
        self.data = CellHolder{ c: emptyCell() };
    }
}
