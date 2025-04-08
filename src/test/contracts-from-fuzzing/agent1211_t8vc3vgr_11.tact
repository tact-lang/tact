struct CellFields {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract CellStorage {
    f: CellFields;
    init() {
        self.f = CellFields{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell(),
        };
    }
}