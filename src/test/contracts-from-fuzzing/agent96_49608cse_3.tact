contract TestContract {
    receive() {
        // Testing escape sequences within a string literal
        let s: String = "Hello, \"Ton\"\nNew Line!";
        // Converting the string to a slice to force its compilation
        let _slice: Slice = s.asSlice();
    }
}
