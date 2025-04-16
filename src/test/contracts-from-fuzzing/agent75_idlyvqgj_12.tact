contract GetSlice {
    receive() {}
    
    // Getter function creating a cell at runtime and returning its slice
    get fun getSlice(): Slice {
         let cellValue: Cell = beginCell().storeUint(123, 64).endCell();
         return cellValue.beginParse();
    }
}
