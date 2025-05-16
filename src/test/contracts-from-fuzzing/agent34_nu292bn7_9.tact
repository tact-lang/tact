contract Test {
    // required receive function
    receive() {}

    // Getter that returns a slice created at runtime
    get fun getSlice() : Slice {
         let c: Cell = beginCell().storeUint(10, 8).endCell();
         return c.beginParse();
    }
}
