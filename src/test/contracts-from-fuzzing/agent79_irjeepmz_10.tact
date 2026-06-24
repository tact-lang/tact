contract UnicodeExtendedTest {
    receive() {
        // Testing Unicode extended escape sequence with curly braces
        dump("Emoji: \u{1F600}".asComment());
    }
}
