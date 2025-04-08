struct CellStruct {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract CellStorage {
    cells: CellStruct;
    init() {
        self.cells = CellStruct{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell()
        };
    }
}