contract TestMultiLineString {
    receive() {
        // Attempting to see how the compiler handles multi-line string
        let s = "Hello
World";
    }
}