contract TestContract {
    intField: Int = 1;
    boolField: Bool = true;
    stringField: String = "abc";
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    optIntField: Int? = null;
    optAddressField: Address? = null;
    optStringField: String? = null;

    init() {
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.intField = 42;
        self.boolField = false;
        self.stringField = "def";
        self.optIntField = 100;
        self.optAddressField = myAddress();
        self.optStringField = "hello";
    }
}