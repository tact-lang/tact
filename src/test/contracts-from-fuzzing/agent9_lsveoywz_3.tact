contract Test {
    receive() {
        let s: String = "Hello, Tact!";
        // Using the string in a context (like converting it to a slice) to ensure it is compiled
        let _slice: Slice = s.asSlice();
    }
}
