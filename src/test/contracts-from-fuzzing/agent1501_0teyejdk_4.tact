contract ManyPrimitives {
    intVal: Int;
    flag: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;

    init() {
        self.intVal = 1;
        self.flag = false;
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.strVal = "test";
    }
}