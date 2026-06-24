contract TestContract {
    intValue: Int = 1;
    boolValue: Bool = true;
    addressValue: Address;
    stringValue: String = "test";
    cellValue: Cell;
    sliceValue: Slice;
    builderValue: Builder;

    init() {
        self.intValue = 42;
        self.boolValue = false;
        self.addressValue = myAddress();
        self.stringValue = "hello";
        self.cellValue = emptyCell();
        self.sliceValue = emptyCell().asSlice();
        self.builderValue = beginCell();
    }
}