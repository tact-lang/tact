contract AllPrimitive {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    stringVal: String;
    cellVal: Cell;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.stringVal = "hi";
        self.cellVal = emptyCell();
    }
}