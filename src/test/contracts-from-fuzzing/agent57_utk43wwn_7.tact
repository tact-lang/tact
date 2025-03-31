contract Test {
    receive() {
        // Test A: Convert a string to a slice and back to string
        let s: String = "slice test";
        let s2: String = s.asSlice().asString();
        dump(s == s2);
    }
}
