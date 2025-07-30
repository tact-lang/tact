contract TestCellsSlices {
    // A helper function defined within the contract to return void (implicitly)
    fun noReturn() { }

    receive() {
        // Testing dump() with Cell, Builder and Slice
        dump(emptyCell());     // Should print debug info of an empty cell
        dump(beginCell());       // Should print debug info of a builder
        dump(emptySlice());      // Should print debug info of an empty slice
        
        // Testing dump() with special values: null and void (from self.noReturn())
        dump(null);            // Should print a debug representation of null
        dump(self.noReturn()); // Should print '#DEBUG#: void'
    }
}
