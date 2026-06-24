contract ManyTypes {
    intVal: Int = 1;
    boolVal: Bool = true;
    stringVal: String = "abc";

    optIntVal: Int? = null;
    optBoolVal: Bool? = null;
    optStringVal: String? = null;
    optCellVal: Cell? = null;
    optBuilderVal: Builder? = null;
    optSliceVal: Slice? = null;
    optAddressVal: Address? = null;

    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    addressVal: Address;

    init() {
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
        self.addressVal = myAddress();
    }
}