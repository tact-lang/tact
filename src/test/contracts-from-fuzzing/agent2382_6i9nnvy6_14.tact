contract ManyPrimitiveFields {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.strVal = "test";
        self.cellVal = emptyCell();
    }
}