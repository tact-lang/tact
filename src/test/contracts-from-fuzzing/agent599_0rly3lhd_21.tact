contract TestContract {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    stringVal: String;
    slVal: Slice;
    clVal: Cell;
    optInt: Int?;
    optAddr: Address?;
    optStr: String?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.stringVal = "ok";
        self.slVal = emptyCell().asSlice();
        self.clVal = emptyCell();
        self.optInt = null;
        self.optAddr = null;
        self.optStr = null;
    }
}