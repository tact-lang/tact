contract UnicodeEscapeTest {
    receive() {
        // Testing Unicode escape sequences in a string literal
        dump("danger, \\u26A1 high voltage \\u26A1".asComment());
    }
}
