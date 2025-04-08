struct Combo {
    intVal: Int;
    intOpt: Int?;
    boolVal: Bool;
    boolOpt: Bool?;
    strVal: String;
    strOpt: String?;
    addrVal: Address;
    addrOpt: Address?;
    cellVal: Cell;
    cellOpt: Cell?;
}

contract TestContract {
    combo: Combo;
    init() {
        self.combo = Combo{
            intVal: 1,
            intOpt: null,
            boolVal: true,
            boolOpt: false,
            strVal: "abc",
            strOpt: null,
            addrVal: myAddress(),
            addrOpt: null,
            cellVal: emptyCell(),
            cellOpt: null
        };
    }
}