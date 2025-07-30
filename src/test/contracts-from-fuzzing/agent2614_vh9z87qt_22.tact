struct CellStruct {
    c1: Cell;
    c2: Cell;
}

contract StructOfCells {
    data: CellStruct;

    init() {
        self.data = CellStruct{
            c1: emptyCell(),
            c2: emptyCell()
        };
    }
}