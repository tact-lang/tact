contract ManyTypes {
    intField: Int = 1;
    boolField: Bool = true;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String = "hello";
    optionalInt: Int? = null;
    optionalBool: Bool? = null;
    optionalAddress: Address? = null;
    optionalCell: Cell? = null;
    optionalSlice: Slice? = null;
    optionalString: String? = null;

    init() {
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}