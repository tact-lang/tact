contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String;
    addressVal: Address;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
        self.stringVal = "hello";
        self.addressVal = myAddress();
    }
}