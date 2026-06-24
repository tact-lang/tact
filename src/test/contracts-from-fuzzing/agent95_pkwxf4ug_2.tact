contract Test {
    receive() {
        let s: String = "Hello, Tact!";
        // Using the string in a function to ensure it's compiled
        dump(s.asSlice());
    }
}
