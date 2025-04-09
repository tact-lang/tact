contract TestContract {
    receive() {
        // Testing Unicode escape sequence using \u notation
        // \u0041 should be translated to 'A'
        let s: String = "Unicode test: \u0041";
        let _slice: Slice = s.asSlice();
    }
}
