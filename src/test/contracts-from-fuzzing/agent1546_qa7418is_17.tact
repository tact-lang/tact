contract MaxPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    addrVal: Address;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    cellOpt: Cell?;
    addrOpt: Address?;

    init() {
        self.intVal = 0;
        self.boolVal = false;
        self.strVal = "";
        self.cellVal = emptyCell();
        self.addrVal = myAddress();

        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.cellOpt = null;
        self.addrOpt = null;
    }
}
