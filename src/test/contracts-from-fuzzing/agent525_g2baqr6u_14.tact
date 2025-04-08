contract Test {
    addr: Address; 
    str: String; 
    cellVal: Cell; 
    sliceVal: Slice; 
    builderVal: Builder;

    init() {
        self.addr = myAddress();
        self.str = "abc";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}