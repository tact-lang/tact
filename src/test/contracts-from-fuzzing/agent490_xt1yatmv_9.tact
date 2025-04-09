struct CellStruct {
    c1: Cell;
    c2: Cell;
    c3: Cell;
}

contract TestContract {
    data: CellStruct;

    init() {
        self.data = CellStruct{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell()
        };
    }
}