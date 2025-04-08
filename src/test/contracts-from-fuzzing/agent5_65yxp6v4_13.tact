struct CellStruct {
    c: Cell;
}

contract CellField {
    val: CellStruct;
    init() {
        self.val = CellStruct{ c: emptyCell() };
    }
}