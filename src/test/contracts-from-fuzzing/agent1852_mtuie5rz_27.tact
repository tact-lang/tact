struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
}

contract ComboStruct {
    inner: Combo;

    init() {
        self.inner = Combo{
            intVal: 7,
            boolVal: true,
            strVal: "str",
            addrVal: myAddress(),
            cellVal: emptyCell()
        };
    }
}