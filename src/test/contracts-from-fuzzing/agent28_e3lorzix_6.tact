contract TestCellAndSliceDump {
    receive() {
        dump(emptyCell());  // Dumping a Cell
        dump(beginCell());  // Dumping a Builder
        dump(emptySlice()); // Dumping a Slice
    }
}
