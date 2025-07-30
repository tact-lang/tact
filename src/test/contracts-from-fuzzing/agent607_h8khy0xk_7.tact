contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.strVal = "test";
        self.optInt = null;
        self.optBool = true;
    }
}