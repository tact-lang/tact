struct CellNest {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract ManyCells {
    cells: CellNest;

    init() {
        self.cells = CellNest{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell()
        };
    }
}