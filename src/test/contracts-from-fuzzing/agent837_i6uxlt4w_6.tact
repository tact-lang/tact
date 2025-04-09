contract LargeVariety {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "abc";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addressVal = myAddress();
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optCell = null;
    }

    receive() {
        let _ = self.strVal;
    }
}