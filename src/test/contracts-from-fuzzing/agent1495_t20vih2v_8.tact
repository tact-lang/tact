contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optBuilder: Builder?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.stringVal = "abc";
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optAddress = null;
        self.optCell = null;
        self.optSlice = null;
        self.optBuilder = null;
    }
}