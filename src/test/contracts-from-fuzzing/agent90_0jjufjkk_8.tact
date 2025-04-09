contract Test7 {
    get fun getSlice(): Slice {
         let c: Cell = beginCell().storeUint(42, 32).endCell();
         return c.asSlice();
    }
    
    receive() {}
}
