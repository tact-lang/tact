contract TestSliceGetter {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(123, 8).endCell();
    }
    
    receive() {}
    
    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
