contract TestSliceCorrect {
    receive() {}

    get fun getSlice(): Slice {
         let c: Cell = beginCell().storeUint(42, 8).endCell();
         return c.beginParse();
    }
}
