contract Test {
    receive() {
        // Test the hashData extension and conversion between String and Slice
        // Create a non-empty string whose underlying cell bits count is divisible by 8
        let s: String = "Test123!";
        let h1: Int = s.hashData();
        let h2: Int = s.asSlice().asString().hashData();
        dump(h1);
        dump(h2);
        // If hash values differ, store 0 in flag (should not happen)
        let flag: Int = h1 == h2 ? 1 : 0;
        dump(flag);
    }
}
