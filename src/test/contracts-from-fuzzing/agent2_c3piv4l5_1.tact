contract TestContract {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    addressField: Address;
    stringField: String;

    init() {
        self.intField = 0;
        self.boolField = false;
        self.cellField = emptyCell();
        self.addressField = myAddress();
        self.stringField = "test";
    }
}
