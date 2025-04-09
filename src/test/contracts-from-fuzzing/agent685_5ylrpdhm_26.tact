struct CellWrap {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract MultiCells {
    cells: CellWrap;

    init() {
        self.cells = CellWrap{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell()
        };
    }
}