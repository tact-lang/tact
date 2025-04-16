contract PrimitiveFieldsContract {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    stringField: String;

    init() {
        self.intField = 5;
        self.boolField = true;
        self.addrField = myAddress();
        self.cellField = emptyCell();
        self.stringField = "done";
    }
}