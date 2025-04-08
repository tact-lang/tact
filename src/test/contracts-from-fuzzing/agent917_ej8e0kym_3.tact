contract ManyTypes {
    intVal: Int = 1;
    boolVal: Bool = true;
    stringVal: String = "test";
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    addressVal: Address;

    init() {
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.addressVal = myAddress();
    }
}