contract Test8 {
    c: Cell;
    
    init() {
        self.c = beginCell().storeInt(99, 8).endCell();
    }
    
    receive() {}

    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
