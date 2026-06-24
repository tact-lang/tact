contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    optionalInt: Int?;
    optionalBool: Bool?;
    stringVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    addressVal: Address;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.optionalInt = null;
        self.optionalBool = false;
        self.stringVal = "hi";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.addressVal = myAddress();
    }
}