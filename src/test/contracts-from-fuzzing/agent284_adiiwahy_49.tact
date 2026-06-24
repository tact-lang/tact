struct CellsStruct {
    c1: Cell;
    c2: Cell;
}

contract CellsCont {
    data: CellsStruct;

    init() {
        self.data = CellsStruct{
            c1: emptyCell(),
            c2: emptyCell()
        };
    }
}