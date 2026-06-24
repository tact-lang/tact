contract StringEscapeTest {
    receive() {
        // Test various valid string escape sequences in Tact:
        let s: String = "escape test: \\ \" \n \t \x41 \u{1F602}";
        // Use emit to output the string as a comment (for testing escape parsing)
        emit(s.asComment());
    }
}
