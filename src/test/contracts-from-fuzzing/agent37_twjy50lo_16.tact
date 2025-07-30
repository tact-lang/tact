contract TestSliceGetter {
    cellVal: Cell;
    
    init() {
        self.cellVal = beginCell().storeUint(123, 64).endCell();
    }
    
    receive() {}
    
    get fun getSlice(): Slice {
         return self.cellVal.beginParse();
    }
}
