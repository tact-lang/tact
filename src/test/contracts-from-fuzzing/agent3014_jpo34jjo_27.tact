// Contract field declaring all primitive types once
contract ManyPrimFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    addrVal: Address;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "abc";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.addrVal = myAddress();
    }
}