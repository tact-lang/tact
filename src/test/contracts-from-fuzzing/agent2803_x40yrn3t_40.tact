struct OptionalCellStruct {
    c: Cell?;
}

contract OptCellInStruct {
    cField: OptionalCellStruct;

    init() {
        self.cField = OptionalCellStruct{c:null};
    }
}