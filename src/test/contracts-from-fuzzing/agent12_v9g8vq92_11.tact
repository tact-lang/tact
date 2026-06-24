contract TestContract {
    // Test 8: String equality and conversion to/from Slice
    receive() {
        let s1: String = "Test";
        let s2: String = "Test";
        // Compare strings using equality operator
        if (s1 == s2) {
            // Convert to Slice and back to String
            let sl: Slice = s1.asSlice();
            let s3: String = sl.asString();
        }
    }
}
