contract MixedTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    addressVal: Address;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.stringVal = "test";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.addressVal = myAddress();
    }
}