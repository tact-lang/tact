contract Test {
    receive() {
        // Test: converting string to slice and back to string
        let s: String = "It's alive!";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        // This test simply ensures s and s2 compile without triggering errors
        let dummy: Int = s.hashData() + s2.hashData();
    }
}
