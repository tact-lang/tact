contract PrimMix {
    flag: Bool = false;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    num: Int = 7;

    init() {
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
    }
}