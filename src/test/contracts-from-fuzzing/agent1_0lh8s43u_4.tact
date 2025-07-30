contract TestDumpCells {
    receive() {
        dump(emptyCell());  // dump a Cell
        dump(beginCell());  // dump a Builder
        dump(emptySlice()); // dump a Slice
        dump("Hello, Tact debug primitives!"); // dump a String
        dump(null); // dump null value
    }
}
