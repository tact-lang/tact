contract ManyPrimitiveFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    addressField: Address;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.stringField = "hello";
        self.cellField = emptyCell();
        self.addressField = myAddress();
    }
}