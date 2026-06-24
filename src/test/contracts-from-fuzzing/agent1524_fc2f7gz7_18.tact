// test all primitive types together
contract PrimMix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;

    init() {
        self.intVal = 99;
        self.boolVal = false;
        self.strVal = "abc";
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.addrVal = myAddress();
    }
}