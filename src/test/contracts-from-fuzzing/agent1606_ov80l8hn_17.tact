struct CellStruct {
    c1: Cell;
    c2: Cell;
}

contract CellStructContract {
    nested: CellStruct;

    init() {
        self.nested = CellStruct{
            c1: emptyCell(),
            c2: emptyCell()
        };
    }
}
