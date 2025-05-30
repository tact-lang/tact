contract TestContract {
    intField: Int = 1;
    boolField: Bool = true;
    addrField: Address;
    strField: String = "hi";
    cellField: Cell;

    init() {
        self.intField = 5;
        self.boolField = false;
        self.addrField = myAddress();
        self.strField = "hello";
        self.cellField = emptyCell();
    }
}