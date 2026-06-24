contract Test {
    receive() {
        dump(emptyCell());  // Cell
        dump(beginCell());  // Builder
        dump(emptySlice()); // Slice
        dump("Hello, Tact"); // String
    }
}
