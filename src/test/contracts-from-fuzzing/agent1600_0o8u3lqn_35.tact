contract AllFieldsContract {
    intF: Int;
    boolF: Bool;
    stringF: String;
    addressF: Address;
    cellF: Cell;
    sliceF: Slice;
    builderF: Builder;
    optIntF: Int?;
    optBoolF: Bool?;
    optStringF: String?;
    optAddressF: Address?;
    optCellF: Cell?;
    optSliceF: Slice?;
    optBuilderF: Builder?;

    init() {
        self.intF = 1;
        self.boolF = true;
        self.stringF = "x";
        self.addressF = myAddress();
        self.cellF = emptyCell();
        self.sliceF = emptyCell().asSlice();
        self.builderF = beginCell();
        self.optIntF = null;
        self.optBoolF = null;
        self.optStringF = null;
        self.optAddressF = null;
        self.optCellF = null;
        self.optSliceF = null;
        self.optBuilderF = null;
    }
}