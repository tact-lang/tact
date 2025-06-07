contract TestContract {
    intValue: Int;
    boolValue: Bool;
    addressValue: Address;
    stringValue: String;
    cellValue: Cell;

    init() {
        self.intValue = 1;
        self.boolValue = false;
        self.addressValue = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.stringValue = "world";
        self.cellValue = emptyCell();
    }

    receive() {
        self.intValue = 2;
        self.boolValue = true;
    }
}