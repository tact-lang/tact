contract WideTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalStr: String?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "test";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.builderVal = beginCell();
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalStr = null;
    }
}