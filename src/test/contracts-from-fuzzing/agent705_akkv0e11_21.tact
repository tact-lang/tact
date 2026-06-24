struct CellNest {
    c1: Cell;
    c2: Cell;
}

struct OuterCells {
    nested: CellNest;
    c3: Cell;
}

contract MultiCells {
    data: OuterCells;

    init() {
        let cell = emptyCell();
        self.data = OuterCells{
            nested: CellNest{ c1: cell, c2: cell },
            c3: cell
        };
    }
}