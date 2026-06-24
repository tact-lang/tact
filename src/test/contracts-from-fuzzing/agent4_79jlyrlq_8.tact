contract Test {
    receive() {
        dump(emptyCell());  // Test dumping a Cell
        dump(beginCell());    // Test dumping a Builder
        dump(emptySlice());   // Test dumping a Slice
    }
}
