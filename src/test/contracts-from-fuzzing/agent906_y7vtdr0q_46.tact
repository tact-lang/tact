struct CellStruct {
    c: Cell;
}

contract CellInStorage {
    data: CellStruct;

    init() {
        self.data = CellStruct{
            c: emptyCell(),
        };
    }
}