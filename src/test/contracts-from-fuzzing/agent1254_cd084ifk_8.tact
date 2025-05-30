contract PrimitiveStorage {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.stringVal = "hi";
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}