contract TestSlice {
    receive() {}

    get fun getSlice(): Slice {
         // Create a cell at runtime inside the getter
         let c: Cell = beginCell().storeUint(123, 32).endCell();
         return c.asSlice();
    }
}
