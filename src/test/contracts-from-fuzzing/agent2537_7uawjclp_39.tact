contract LargeVariety {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    addr: Address;
    optAddr: Address?;
    cellVal: Cell;
    optCell: Cell?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "hi";
        self.optInt = null;
        self.optBool = false;
        self.optStr = null;
        self.addr = myAddress();
        self.optAddr = null;
        self.cellVal = emptyCell();
        self.optCell = null;
    }
}