contract AllTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "mixed";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
    }
}