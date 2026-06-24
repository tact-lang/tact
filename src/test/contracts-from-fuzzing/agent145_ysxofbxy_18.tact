struct CellStruct {
    c1: Cell;
    c2: Cell;
}

contract CellsInStruct {
    storage: CellStruct;
    num: Int;

    init() {
        self.storage = CellStruct { c1: emptyCell(), c2: emptyCell() };
        self.num = 5;
    }
}