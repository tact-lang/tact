contract TestContract {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    addressField: Address;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.stringField = "hello";
        self.cellField = emptyCell();
        self.addressField = myAddress();
    }
}