contract TestSliceGetter {
    cellVar: Cell;
    
    init() {
         self.cellVar = beginCell().storeUint(42, 8).endCell();
    }
    
    receive() {}
    
    // Getter returning a Slice obtained from cellVar
    get fun getSlice(): Slice {
        return self.cellVar.asSlice();
    }
}
