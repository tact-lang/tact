contract MixedTypes {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    strVal: String;
    optStr: String?;
    cellVal: Cell;
    optCell: Cell?;
    addrVal: Address;
    optAddr: Address?;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.optInt = null;
        self.optBool = true;
        self.strVal = "test";
        self.optStr = null;
        self.cellVal = emptyCell();
        self.optCell = emptyCell();
        self.addrVal = myAddress();
        self.optAddr = null;
    }
}