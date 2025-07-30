contract TestContract {
    intField: Int = 7;
    boolField: Bool = true;
    addressField: Address;
    cellField: Cell;         // remove default init
    sliceField: Slice;       // remove default init
    stringField: String = "test";
    optInt: Int? = null;
    optBool: Bool? = true;
    optAddress: Address? = null;
    optStr: String? = "abc";

    init() {
        self.intField = 7;
        self.boolField = true;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "test";
        self.optInt = 42;
        self.optBool = null;
        self.optAddress = myAddress();
        self.optStr = null;
    }

    receive() {
        let s = self.stringField;
    }
}