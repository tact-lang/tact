contract AllPrimitives {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "x";
        self.addr = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
    }
}