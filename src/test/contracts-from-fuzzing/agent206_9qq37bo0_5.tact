contract MixedPrimitives {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    stringField: String;
    cellField: Cell;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.addrField = myAddress();
        self.stringField = "hello";
        self.cellField = emptyCell();
    }
}
