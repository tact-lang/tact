contract ScalarCombo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addressVal: Address?;
    cellVal: Cell;

    init() {
        self.intVal = 5;
        self.boolVal = true;
        self.strVal = "hello";
        self.addressVal = null;
        self.cellVal = emptyCell();
    }
}