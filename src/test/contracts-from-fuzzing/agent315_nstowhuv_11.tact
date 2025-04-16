contract LargeMixed {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
    
    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.strVal = "hi";
        self.cellVal = emptyCell();
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optStr = null;
        self.optCell = null;
    }
}