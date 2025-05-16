struct Combined {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
    cellOpt: Cell?;
}

contract AllIn {
    combined: Combined;

    init() {
        self.combined = Combined{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            strVal: "test",
            cellVal: emptyCell(),
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            strOpt: null,
            cellOpt: null
        };
    }
}