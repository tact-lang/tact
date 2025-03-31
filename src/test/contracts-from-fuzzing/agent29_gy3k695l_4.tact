contract TestCells {
    receive("debug") {
        dump(emptyCell());   // dump a Cell
        dump(beginCell());   // dump a Builder
        dump(emptySlice());  // dump a Slice
    }
}
