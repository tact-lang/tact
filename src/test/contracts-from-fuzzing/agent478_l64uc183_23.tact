struct CellFields {
    c1: Cell;
    c2: Cell;
    optC: Cell?;
}

contract CellsStruct {
    d: CellFields;
    init() {
        self.d = CellFields{
            c1: emptyCell(),
            c2: emptyCell(),
            optC: null
        };
    }
}