contract LargeFieldVariety {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optionalIntField: Int?;
    optionalBoolField: Bool?;
    optionalAddressField: Address?;
    optionalCellField: Cell?;
    optionalSliceField: Slice?;
    optionalStringField: String?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.stringField = "test";
        self.optionalIntField = null;
        self.optionalBoolField = null;
        self.optionalAddressField = null;
        self.optionalCellField = null;
        self.optionalSliceField = null;
        self.optionalStringField = null;
    }
}