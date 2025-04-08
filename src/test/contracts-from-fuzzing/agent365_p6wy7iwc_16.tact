struct Compound {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    addr: Address;
    cellVal: Cell;
}

contract ComplexFields {
    field: Compound;
    init() {
        self.field = Compound {
            intVal: 42,
            boolVal: false,
            optInt: null,
            optBool: true,
            addr: myAddress(),
            cellVal: emptyCell()
        };
    }
}