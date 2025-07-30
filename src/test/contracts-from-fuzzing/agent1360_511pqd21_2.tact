contract ManyTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    addrField: Address;
    cellField: Cell;
    
    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "hello";
        self.addrField = myAddress();
        self.cellField = emptyCell();
    }
}