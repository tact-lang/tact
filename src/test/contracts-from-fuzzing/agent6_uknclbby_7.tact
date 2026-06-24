contract DebugTestCells {
    receive("debug") {
        dump(emptyCell());  // Cell
        dump(beginCell());  // Builder
        dump(emptySlice()); // Slice
        cashback(sender());
    }
}
