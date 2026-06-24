contract Test {
    receive() {}
    
    // Getter returning a Slice constructed via rawSlice.
    // This tests that getters can return Slice types.
    get fun getSlice(): Slice {
         return rawSlice("0deadbeef");
    }
}
