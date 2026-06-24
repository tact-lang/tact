contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = beginCell().endCell();
        self.builderVal = beginCell();
        self.sliceVal = self.cellVal.asSlice();
        self.strVal = "test";
        self.optInt = null;
        self.optBool = false;
    }
}