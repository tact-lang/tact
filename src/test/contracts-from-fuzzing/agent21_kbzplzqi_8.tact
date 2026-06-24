contract TestStringAsSlice {
    receive() {
        // Convert string to slice and back to string
        let s: String = "Hello, Tact!";
        let slice1: Slice = s.asSlice();
        let s2: String = slice1.asString();
        // Compare the strings using an if-else statement
        if (s == s2) {
            // Correct behavior: strings are equal.
            let dummy: Int = 1;
        } else {
            let dummy: Int = 0;
        }
    }
}
