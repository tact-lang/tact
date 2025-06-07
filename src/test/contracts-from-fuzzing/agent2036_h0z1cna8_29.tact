struct CellNest {
    c1: Cell;
    c2: Cell?;
}

contract Test {
    f: CellNest;

    init() {
        self.f = CellNest{ c1: emptyCell(), c2: null };
    }
}