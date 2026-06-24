contract MultiplePrimitiveFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    addressField: Address;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.stringField = "test";
        self.cellField = emptyCell();
        self.addressField = myAddress();
    }
}
