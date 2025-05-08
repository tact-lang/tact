contract Test {
    receive() {
        // Testing conversion from string to slice and back to string
        let s: String = "Roundtrip string \u263A Test";
        let s_slice: Slice = s.asSlice();
        let s_back: String = s_slice.asString();
        if (s == s_back) {
            // Successful roundtrip
        } else {
            // Should not happen
        }
    }
}
