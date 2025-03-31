contract Test {
    receive() {
        // Test converting a string to a slice and back to string
        let s: String = "Hello, \nTact!";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();
        dump(s2);
    }
}
