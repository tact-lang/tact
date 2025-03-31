contract EscapeSequencesTest {
    init() {
        let test1: String = "Line 1\nLine 2";            // Newline
        let test2: String = "Escape \\ and quote: \" ";   // Backslash and double quote
        let test3: String = "Tab\tspace";                  // Tab
        let test4: String = "Unicode: \u26A1";             // Unicode character
    }
}