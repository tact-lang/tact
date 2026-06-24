contract TestDumpCells {
    receive() {
        dump(emptyCell());         // Testing dumping an empty Cell
        dump(beginCell());           // Testing dumping a Builder (beginCell returns a Builder)
        dump(emptySlice());          // Testing dumping an empty Slice
        // Note: dump(beginTailString()) is intentionally omitted due to known issues with StringBuilder.
    }
}
