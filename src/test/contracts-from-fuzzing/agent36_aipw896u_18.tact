contract UnfinishedEscapeTest {
    receive() {
        // This string ends with an unfinished escape sequence (backslash at the end)
        let s: String = "This is invalid because it ends with a backslash \\"; 
        dump(s);
    }
}
