contract TestSlice {
    s: Slice;
    
    init() {
        self.s = beginCell().storeUint(42, 8).asSlice();
    }
    
    receive() {}
    
    get fun getSlice(): Slice {
         return self.s;
    }
}
