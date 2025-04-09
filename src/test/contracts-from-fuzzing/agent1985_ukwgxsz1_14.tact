struct CellHolder {
    c: Cell;
}

contract CellStructField {
    data: CellHolder;

    init() {
        self.data = CellHolder{ c: emptyCell() };
    }
}
