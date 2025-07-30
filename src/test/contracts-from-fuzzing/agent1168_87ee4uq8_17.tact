contract DifferentPrimitives {
    n: Int;
    flag: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    text: String;

    init() {
        self.n = 1;
        self.flag = true;
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.text = "hi";
    }
}