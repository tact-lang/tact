contract ManyFieldsTypes {
    intVal: Int = 1;
    boolVal: Bool = false;
    strVal: String = "str";
    addrVal: Address;
    sliceVal: Slice;
    cellVal: Cell;

    init() {
        self.intVal = 25;
        self.boolVal = true;
        self.strVal = "hello";
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
    }
}