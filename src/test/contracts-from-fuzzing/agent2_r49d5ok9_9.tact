contract TestSlice {
    // Test dump() with a Slice primitive
    receive() {
        dump(emptySlice());
    }
}
