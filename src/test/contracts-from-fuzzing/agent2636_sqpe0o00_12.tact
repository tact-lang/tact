struct CellStruct {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract CellVars {
    s: CellStruct;

    init() {
        self.s = CellStruct{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell(),
        };
    }
}