contract ManyTypes {
    intVal: Int = 42;
    boolVal: Bool = true;
    addr: Address;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    strVal: String = "hello";

    init() {
        self.addr = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
    }
}