contract MixedTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    addressVal: Address;
    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.stringVal = "abc";
        self.cellVal = emptyCell();
        self.addressVal = myAddress();
    }
}