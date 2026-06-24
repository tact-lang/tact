struct CellData {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract C {
    data: CellData;

    init() {
        self.data = CellData{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell()
        };
    }
}