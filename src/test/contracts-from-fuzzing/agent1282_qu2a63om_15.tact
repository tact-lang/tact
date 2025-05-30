// Many simple fields with different primitive types
contract WidePrimitiveSet {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "s";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.optInt = null;
        self.optStr = null;
        self.optBool = null;
    }
}
