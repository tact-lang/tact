struct CellInStruct {
    c: Cell;
    s: String;
}

contract CellStructPersist {
    state: CellInStruct;
    init() {
        self.state = CellInStruct{ c: emptyCell(), s: "x" };
    }
}