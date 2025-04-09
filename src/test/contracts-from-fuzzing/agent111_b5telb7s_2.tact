contract TestStringEscape {
    receive() {
        // Testing escape characters: newline, tab, and quoted double quote
        let s: String = "Line1\nLine2\tTabbed \"Quote\"";
    }
}
