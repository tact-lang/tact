contract DebugTestCells {
    receive() {
         dump(emptyCell()); // dumps an empty Cell
         dump(beginCell()); // dumps a Builder
         dump(emptySlice()); // dumps an empty Slice
    }
}
