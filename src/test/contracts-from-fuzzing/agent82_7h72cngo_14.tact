contract TestEmptyString {
    receive() {
        // Test handling of empty string literal, conversion to slice and back
        let s: String = "";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        let _cmp: Bool = (s == s2);
    }
}
