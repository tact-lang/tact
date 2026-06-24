contract TestSlice {
    c: Cell;

    init() {
         self.c = beginCell().storeUint(255, 8).endCell();
    }
    
    receive() {}
    
    get fun get_slice(): Slice {
         let s: Slice = self.c.beginParse();
         return s;
    }
}
