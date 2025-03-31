contract TestContract {
    receive() {
        // Test conversion from String to Slice and back
        let s: String = "Test string conversion";
        let slice: Slice = s.asSlice();
        let s2: String = slice.asString();
        if (s == s2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
