contract Test {
    receive() {
        // Testing dump with an empty Slice
        dump(emptySlice());
    }
}
