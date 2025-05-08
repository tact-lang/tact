contract ValidEscape {
    receive() {
        // Testing valid escape sequences: newline, tab, escaped double quote, and backslash
        let s: String = "Line1\nLine2\t\"Quoted\"\\Backslash";
    }
}
