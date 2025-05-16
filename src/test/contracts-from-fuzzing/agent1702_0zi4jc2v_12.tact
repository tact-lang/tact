contract TestContract {
    intVal: Int = 1;
    boolVal: Bool = false;
    stringVal: String = "abc";
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optIntVal: Int?;

    init() {
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.optIntVal = null;
    }
}