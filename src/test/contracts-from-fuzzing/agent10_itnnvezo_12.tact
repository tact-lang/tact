contract Test7 {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(42, 7).endCell();
    }
    
    // Getter function returning a Slice from cell c
    get fun getSlice(): Slice {
         return self.c.beginParse();
    }
    
    receive() {}
}
