contract ManyTypes {
    intVal: Int = 1;
    boolVal: Bool = true;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String = "hello";
    optInt: Int? = null;

    init() {
        self.addressVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }
}