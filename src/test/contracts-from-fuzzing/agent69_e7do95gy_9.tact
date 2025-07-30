contract TestStringSliceRoundtrip {
    receive() {
        // Test 8: String.asSlice round-trip
        let s: String = "Roundtrip test";
        let slice1: Slice = s.asSlice();
        let s2: String = slice1.asString();
    }
}
