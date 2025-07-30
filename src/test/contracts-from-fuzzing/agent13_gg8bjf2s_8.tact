contract Test {
    receive() {
        dump(emptySlice());  // Testing dump() with a Slice
    }
}
