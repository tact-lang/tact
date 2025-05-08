contract Test {
    receive() {
        // Testing rawSlice() with an odd-length hex string without underscore
        let s = rawSlice("4");
    }
}
