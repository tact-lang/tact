contract ManyTypes {
    intVal: Int = 7;
    boolVal: Bool = true;
    strVal: String = "hi";
    optInt: Int? = null;
    optStr: String? = null;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}
