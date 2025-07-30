contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    // Attempting a multiline string literal
    return "This is a test
across multiple lines.";
}