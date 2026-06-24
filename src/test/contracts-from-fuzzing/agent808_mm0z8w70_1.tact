contract MultiPrimitives {
    num: Int;
    flag: Bool;
    addr: Address;
    txt: String;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;

    init() {
        self.num = 1;
        self.flag = true;
        self.addr = myAddress();
        self.txt = "Hello";
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = self.cellVal.asSlice();
    }
}