contract ManyTypes {
    intVal: Int = 5;
    boolVal: Bool = true;
    strVal: String = "hello";
    optInt: Int? = null;
    optBool: Bool? = false;
    optStr: String? = null;
    addr: Address;
    cellVal: Cell;
    slc: Slice;

    init() {
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.slc = self.cellVal.asSlice();
    }
}