contract TestContract {
    receive() {
        dump(emptyCell());  // Testing dump with Cell
        dump(beginCell());  // Testing dump with Builder
        dump(emptySlice()); // Testing dump with Slice
    }
}
