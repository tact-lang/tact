contract ExtremeTypes {
    intField: Int;
    intOpt: Int?;
    boolField: Bool;
    boolOpt: Bool?;
    addrField: Address;
    addrOpt: Address?;
    sliceField: Slice;
    sliceOpt: Slice?;
    cellField: Cell;
    cellOpt: Cell?;
    stringField: String;
    stringOpt: String?;

    init() {
        self.intField = 1;
        self.intOpt = null;
        self.boolField = false;
        self.boolOpt = null;
        self.addrField = myAddress();
        self.addrOpt = null;
        self.sliceField = emptyCell().asSlice();
        self.sliceOpt = null;
        self.cellField = emptyCell();
        self.cellOpt = null;
        self.stringField = "hi";
        self.stringOpt = null;
    }
}