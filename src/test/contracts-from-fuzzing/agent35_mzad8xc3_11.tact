contract Test {
    receive() {
        // Test conversion: String -> Slice -> String
        // Expect that converting a string to a slice and back results in the same string
        let s: String = "Test string for asSlice conversion";
        let slice1: Slice = s.asSlice();
        let s2: String = slice1.asString();
        if (s == s2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
