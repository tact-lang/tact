struct CellStruct {
    a: Cell;
    b: Cell;
    c: Cell;
}

contract Storage {
    s: CellStruct;

    init() {
        self.s = CellStruct{
            a: emptyCell(),
            b: emptyCell(),
            c: emptyCell()
        };
    }
}