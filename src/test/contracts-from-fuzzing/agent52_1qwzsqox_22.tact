struct CellFields {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract TestContract {
    cells: CellFields;

    init() {
        self.cells = CellFields{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell()
        };
    }
}
