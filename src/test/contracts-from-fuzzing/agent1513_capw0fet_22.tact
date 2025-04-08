struct CellStruct {
    c1: Cell;
    c2: Cell;
}

contract CellContract {
    s: CellStruct;

    init() {
        self.s = CellStruct{
            c1: emptyCell(),
            c2: emptyCell()
        };
    }
}