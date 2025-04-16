contract MixedPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "s";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addrVal = myAddress();
        self.intOpt = null;
        self.boolOpt = false;
        self.addrOpt = null;
    }
}