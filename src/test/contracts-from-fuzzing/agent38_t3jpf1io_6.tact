contract MixedPrimitives {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;

    init() {
        self.intVal = 100;
        self.boolVal = true;
        self.optInt = null;
        self.optBool = false;
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "hello";
    }
}