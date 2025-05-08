// Testing many fields with mix of primitive types and nullables
contract ManyFields {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    strField: String;
    sliceField: Slice;
    cellField: Cell;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optSlice: Slice?;
    optCell: Cell?;
    
    init() {
        self.intField = 1;
        self.boolField = true;
        self.addrField = myAddress();
        self.strField = "str";
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optStr = null;
        self.optSlice = null;
        self.optCell = null;
    }
}