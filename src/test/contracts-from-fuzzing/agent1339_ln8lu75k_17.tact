struct CellNest {
    c1: Cell;
    c2: Cell?;
}

contract CellFields {
    cells: CellNest;

    init() {
        self.cells = CellNest{
            c1: emptyCell(),
            c2: null
        };
    }
}