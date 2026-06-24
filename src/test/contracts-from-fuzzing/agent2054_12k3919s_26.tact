struct CellFields {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract ManyCells {
    data: CellFields;
    init() {
        self.data = CellFields{ c1: emptyCell(), c2: emptyCell(), c3: emptyCell() };
    }
}