contract Test {
    receive() {
        // Testing the asSlice() extension of String by converting to slice and back to string
        let s: String = "Test string for asSlice";
        let slice: Slice = s.asSlice();
        let recovered: String = slice.asString();
        if (s == recovered) {
            // do nothing, just testing equality
        }
    }
}
