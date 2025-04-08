struct CellNest {
    c1: Cell;
    c2: Cell;
    c3: Cell;
    c4: Cell;
}

contract NestedCells {
    storage: CellNest;

    init() {
        self.storage = CellNest{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell(),
            c4: emptyCell(),
        };
    }
}