contract Test {
    receive() {
        // Test conversion from String to Slice and back to String
        let s: String = "Hello, Tact!";
        let s2: String = s.asSlice().asString();
        dump(s == s2);
    }
}
