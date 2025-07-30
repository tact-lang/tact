contract DebugTestCellBuilderSlice {
    // Testing dump() with Cell, Builder, and Slice types
    receive() {
        dump(emptyCell());   // Cell
        dump(beginCell());     // Builder
        dump(emptySlice());    // Slice
    }
}
