contract SpecialEscapeSequencesTest {
    init() {
        let test1: String = "This is a backslash: \\";       // Backslash
        let test2: String = "Quotes: \"This is quoted text\""; // Double quotes
        let test3: String = "Line 1\nLine 2";                // Newline
        let test4: String = "List item:\n\t- Item 1\n\t- Item 2"; // Newline and Tab
        let test5: String = "Unicode character: \u263A";     // Unicode character (smiley)
    }
}