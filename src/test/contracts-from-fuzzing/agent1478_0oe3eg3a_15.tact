struct CellStruct {
    c: Cell;
    value: Int;
}

contract CellContract {
    data: CellStruct;
    init() {
        self.data = CellStruct{ c: emptyCell(), value: 7 };
    }
}
