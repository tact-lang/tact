// contract with many different primitive persistent fields
contract VariousPrim {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "hi";
        self.optInt = null;
        self.optStr = null;
        self.optBool = null;
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}