struct CellStruct {
    c1: Cell;
    c2: Cell?;
    c3: Cell;
    c4: Cell?;
    c5: Cell?;
}

contract TestContract {
    cells: CellStruct;

    init() {
        self.cells = CellStruct{
            c1: emptyCell(),
            c2: null,
            c3: emptyCell(),
            c4: null,
            c5: null
        };
    }
}